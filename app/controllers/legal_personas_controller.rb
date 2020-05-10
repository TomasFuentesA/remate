class LegalPersonasController < ApplicationController
  load_and_authorize_resource
  before_action :set_legalpersona, only: [:edit,:show,:destroy]
  before_action :display_values, only: [:show]


  def index
    @legalPersonas = LegalPersona.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @legalPersonas.map(&:name) }
    end
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
  end

  def show
    @legal_member = LegalMember.new
    @persona_member = PersonaMember.new
  end

  def destroy
    @legalpersona.delete
    redirect_to legal_personas_path, notice: "Persona jurídica eliminada!"
  end





private
  def display_values
    @able = @legalpersona
    @phones = @able.phones
    @emails = @able.emails
    @domains = @able.domains
    @directions = @able.directions
    @jobs = @able.jobs
    @persona_members = @able.personas
    @legal_members = @able.legal_asociados
  end

  def set_legalpersona
      @legalpersona = LegalPersona.find(params[:id])
  end

  def legal_persona_params
      params.require(:legal_persona).permit(:rut, :name, :fantasy_name, :alias, :web)
  end
end
