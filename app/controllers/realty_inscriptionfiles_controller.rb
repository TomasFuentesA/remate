class RealtyInscriptionfilesController < InheritedResources::Base

  private

    def realty_inscriptionfile_params
      params.require(:realty_inscriptionfile).permit(:file_name, :observation, :date, :realty_inscription_id)
    end

end
