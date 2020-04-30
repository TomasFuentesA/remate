class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show,:edit]


  def index
    @inscriptions = Inscription.all
  end

  def new
    @inscription = Inscription.new
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.save
    redirect_to inscriptions_path
  end

  def show
  end

  def edit
  end


  private
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    params.require(:inscription).permit(:foja, :number,:year,:cbrs )

  end

end
