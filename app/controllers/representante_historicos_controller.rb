class RepresentanteHistoricosController < InheritedResources::Base

  private

    def representante_historico_params
      params.require(:representante_historico).permit(:persona_id, :entrada, :salida, :legal_persona_id)
    end

end
