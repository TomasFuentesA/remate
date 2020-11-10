class RealtyDomainsController < InheritedResources::Base

  private

    def realty_domain_params
      params.require(:realty_domain).permit(:type_modality, :price, :date_posetion)
    end

end
