class RealtyCompradorsController < InheritedResources::Base

  private

    def realty_comprador_params
      params.require(:realty_comprador).permit(:persona_id, :type_member, :precio, :percentage, :realty_domainrols_id)
    end

end
