class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show,:edit]
  belongs_to :domains

  def index
    @inscriptions = Inscription.all
  end

  def new
    @inscription = Inscription.new
    @domain = Domain.find(params[:domain_id])
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.save
    redirect_to @inscription , notice:  "Inscripción creada"
  end

  def show
  end

  def edit
    @domain = Domain.find(params[:domain_id])
  end


  private
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    params.require(:inscription).permit(:foja, :number,:year,:cbrs,:domain_id,:date )

  end

end
