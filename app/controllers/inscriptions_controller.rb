class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show]

  def index
    @inscriptions = Inscription.all
  end

  def new
    @domain = Domain.find(params[:domain_id])
    
    
    @inscription = Inscription.new
    Rails.logger.info "test"
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.save
    Rails.logger.info "test2"
    redirect_to @inscription , notice:  "Inscripción creada"
    
  end

  def show
  end

  def edit
    Rails.logger.info "test3"
    @inscription = Inscription.find(params[:domain_id])
    @domain = Domain.find(params[:id])
  end

  def update
    Rails.logger.info "test4"
    @inscription.update(inscription_params)
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
