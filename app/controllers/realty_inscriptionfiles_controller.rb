class RealtyInscriptionfilesController < InheritedResources::Base

  def create
    @realtyinscriptionfile = RealtyInscriptionfile.new(realty_inscriptionfile_params)
    @realtyinscriptionfile.save
    @realtyinscription = RealtyInscription.find(params[:realty_inscriptionfile][:realty_inscription_id])
    redirect_to @realtyinscription, notice: "Archivo agregrado con exito"
  end

  def destroy
    @realtyinscriptionfile = RealtyInscriptionfile.find(params[:id])
    @realtyinscription = RealtyInscription.find(@realtyinscriptionfile.realty_inscription_id)
    @realtyinscriptionfile.destroy
    redirect_to @realtyinscription
  end

  private

    def realty_inscriptionfile_params
      params.require(:realty_inscriptionfile).permit(:file_name, :observation, :date, :realty_inscription_id)
    end

end
