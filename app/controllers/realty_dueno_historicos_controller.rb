class RealtyDuenoHistoricosController < InheritedResources::Base

  private

    def realty_dueno_historico_params
      params.require(:realty_dueno_historico).permit(:persona_id, :realty_id, :type_member, :salida, :entrada)
    end

end
