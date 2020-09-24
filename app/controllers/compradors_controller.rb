class CompradorsController < InheritedResources::Base
  load_and_authorize_resource

  def new
    @compradors = Comprador.new
  end

  def index
    @compradors = Comprador.all
  end


  def create

    begin
      @comprador = Comprador.create(comprador_params)
      @comprador.save
    rescue => exception
      Rails.logger.info exception.to_s
      Rails.logger.info @comprador.errors.full_messages.to_s
      flash[:errors] = @comprador.errors.full_messages
      
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
        params.require(:comprador).permit(:persona_id, :acciones, :percentage, :domain_rols_id, :type_member)
      rescue => exception
        Rails.logger.info exception.to_s
      end
      
    end

end
