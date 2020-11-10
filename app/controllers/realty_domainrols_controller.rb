class RealtyDomainrolsController < InheritedResources::Base

  private

    def realty_domainrol_params
      params.require(:realty_domainrol).permit(:type_member, :type_rol, :persona_id, :precio, :realty_domains_id)
    end

end
