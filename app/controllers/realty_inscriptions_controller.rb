class RealtyInscriptionsController < InheritedResources::Base

  private

    def realty_inscription_params
      params.require(:realty_inscription).permit(:foja, :number, :year, :cbrs, :date, :realty_domains_id)
    end

end
