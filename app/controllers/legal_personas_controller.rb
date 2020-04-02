class LegalPersonasController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @legalPersonas = LegalPersona.all
  end
  def new
    @legalpersona = LegalPersona.new
  end
  def create
    @legalpersona = LegalPersona.new(legal_persona_params)
    @legalpersona.save
    redirect_to legal_personas_path
  end

  def edit
      @legalpersona = LegalPersona.find(params[:id])
  end

  def show
      @legalpersona = LegalPersona.find(params[:id])
      @able = @legalpersona
      @directions = @able.directions
      @phones = @able.phones
      @emails = @able.emails

  end

  def destroy
    @legalpersona = LegalPersona.find(params[:id])
    if @legalpersona.present?
      @legalpersona.destroy
    end
    redirect_to legal_personas_path, notice: "Persona jurídica eliminada!"
  end
private

  def legal_persona_params
      params.require(:legal_persona).permit(:rut, :name, :fantasy_name, :alias, :web)
  end


end
