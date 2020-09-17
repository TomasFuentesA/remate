class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show]

  def index
    @inscriptions = Inscription.all
  end

  def new
    @domain = Domain.find(params[:domain_id])
    @inscription = Inscription.new
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.save
    redirect_to @inscription , notice: "Inscripción creada"
  end

  def show
  end

  def edit
    @inscription = Inscription.find(params[:domain_id])
    @domain = Domain.find(params[:id])
  end

  def update
    Inscription.order(:id).each do |inscrip|
      if inscrip.id == params[:inscription][:id].to_i
        inscrip.update(inscription_params)
      end 
    end
  end  

  def destroy
    Inscription.order(:id).each do |inscrip|
      if inscrip.id == params[:inscription][:id].to_i
        inscrip.destroy
      end 
    end
  end

  private
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    params.require(:inscription).permit(:foja, :number,:year,:cbrs,:domain_id,:date )
  end

end
