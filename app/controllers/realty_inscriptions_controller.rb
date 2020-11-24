class RealtyInscriptionsController < InheritedResources::Base
  before_action :set_realty_inscription, only: [:show]

  def new
    @realty_inscription = RealtyInscription.new
  end

  def index
    @realty_inscriptions = RealtyInscription.all
  end

  def create
    @realty_inscription = RealtyInscription.new(realty_inscription_params)
    if @realty_inscription.save
      @realty_domain = RealtyDomain.find(@realty_inscription.realty_domains_id)
      redirect_to @realty_domain , notice: "Inscripción creada"
    end
  end
  private
    def set_realty_inscription
      @realty_inscription = RealtyInscription.find(params[:id])
    end
    def realty_inscription_params
      params.require(:realty_inscription).permit(:foja, :number, :year, :cbrs, :date, :realty_domains_id)
    end

end
