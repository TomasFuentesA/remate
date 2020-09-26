class CompradorsController < InheritedResources::Base
  load_and_authorize_resource

  def new
    @compradors = Comprador.new
    
  end

  def index
    @compradors = Comprador.all
  end


  def create
    Rails.logger.info"acaaaaa"
     Comprador.transaction do
      #@auction = Comprador.new(persona_id:1, acciones:"ASD", percentage:1,domain_rol_id: 1, type_member:"ASDASD")
      @auction = Comprador.new(comprador_params)
      if @auction.save
       else
       render json: { error:  @auction.errors.full_messages }, status: :bad_request
      end
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
