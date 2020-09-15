class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show]

  def index
    @inscriptions = Inscription.all
  end

  def new
    @domain = Domain.find(params[:domain_id])
    #Rails.logger.info "test"
    @inscription = Inscription.new
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.save
    redirect_to @inscription , notice:  "Inscripción creada"
  end

  def show
  end

  def edit
    @domain = Inscription.find(params[:domain_id])
  end

  def update
    @inscription.update(inscription_params)
    #redirect_to @domainable
  end  

  def destroy
    @domain.destroy
    redirect_to domains_path
  end

  private
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    params.require(:inscription).permit(:foja, :number,:year,:cbrs,:domain_id,:date )

  end

end
