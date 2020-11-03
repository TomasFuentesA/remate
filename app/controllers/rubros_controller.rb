class RubrosController < InheritedResources::Base

  def create
    @legal_persona = LegalPersona.find(params[:legal_persona_id].to_i)
    @rubro = Rubro.new(rubro_params)
    @rubro.save
    flash[:notice] = "Rubro añadido con exito"
    redirect_to new_legal_persona_activity_path(@legal_persona)
  end

  private

    def rubro_params
      begin
        params.require(:rubro).permit(:nombre)
      rescue => exception
        params.permit(:nombre)
      else
        
      end

    end

end
