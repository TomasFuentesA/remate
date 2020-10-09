class CompradorsController < InheritedResources::Base
  load_and_authorize_resource

  def new
    @compradors = Comprador.new
    
  end

  def index
    @compradors = Comprador.all
  end


  def create
    @domainrol = DomainRol.find(params[:comprador][:domain_rol_id])
    @domain = Domain.find(@domainrol.domain_id)
    
    total = 0
    Comprador.order(:id).each do |comp|
      if comp.domain_rol_id == params[:comprador][:domain_rol_id].to_i
        total += comp.acciones
      end  
    end

    Rails.logger.info total

    if (total + params[:comprador][:acciones].to_i) <= @domain.price
      Comprador.transaction do  
        #@auction = Comprador.new(persona_id:1, acciones:"ASD", percentage:1,domain_rol_id: 1, type_member:"ASDASD")
        @auction = Comprador.new(comprador_params)
        if @auction.save
          flash[:notice] =  "Ingresado exitosamente"
          redirect_to @domain
            
        else
          render json: { error:  @auction.errors.full_messages }, status: :bad_request
        end
      end
    else
      flash[:alert] = "Excede la cantidad de acciones totales"
      redirect_to new_domain_rol_comprador_path(@domainrol.id)
    end
    
  end

  def edit
    @comprador = Comprador.find(params[:id])
  end


  def update
    @comprador.update(comprador_params)
    redirect_to comprador_path
  end

  def destroy
    @comprador.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to comprador_path, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end
 
  #"comprador"=>{"type_member"=>"Empresa", "persona_id"=>"9", "acciones"=>"120", "percentage"=>"0.12", "domain_rols_id"=>"32"},
  private


    def comprador_params
      begin
        params.require(:comprador).permit(:persona_id, :acciones, :percentage, :domain_rol_id, :type_member)
      rescue => exception
        Rails.logger.info exception.to_s
      end
      
    end

end
