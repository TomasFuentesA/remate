class InscriptionsController < ApplicationController
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
      @inscription = Inscription.find(params[:id])
  end

  def edit
    @inscription = Inscription.find(params[:id])
  end


  private

  def inscription_params
    params.require(:inscription).permit(:foja, :number,:year,:cbrs )

  end








end
