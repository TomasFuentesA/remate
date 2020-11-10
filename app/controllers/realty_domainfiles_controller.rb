class RealtyDomainfilesController < InheritedResources::Base

  private

    def realty_domainfile_params
      params.require(:realty_domainfile).permit(:file_name, :observation)
    end

end
