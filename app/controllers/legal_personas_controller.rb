class LegalPersonasController < ApplicationController
  load_and_authorize_resource
  before_action :set_legalpersona, only: [:edit,:show,:update,:destroy]
  before_action :display_values, only: [:show]


  def index
    @legalpersonas = LegalPersona.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @legalPersonas.map(&:name) }
    end
  end

  def new
    @legalpersona = LegalPersona.new
  end

  def create
    Rails.logger.info params
    @legalpersona = LegalPersona.new(legal_persona_params)
    if @legalpersona.save
      flash[:notice] =  "ingresado exitosamente"
      redirect_to legal_personas_path
    else
      flash[:errors] = @legalpersona.errors.full_messages
      redirect_to new_legal_persona_path
    end
  end

  def edit
  end

  def show
    @legal_member = LegalMember.new
    @persona_member = PersonaMember.new
  end

  def update
    @legalpersona.update(legal_persona_params)
    redirect_to legal_personas_path
  end

  def destroy
    @legalpersona.delete
    redirect_to legal_personas_path, notice: "Persona jurídica eliminada!"
  end

  def searchFilterData 
    @param = "%"+params[:q]+"%"
    @persona = LegalPersona.where("concat(rut, name , fantasy_name, alias, web) like ?",@param)
    render json: @persona
  end


private
  def display_values
    @able = @legalpersona
    @phones = @able.phones
    @emails = @able.emails
    @domains = @able.domains
    @directions = @able.directions
    @activities = @able.activities
    @jobs = @able.jobs
    #@legal_members = @able.legal_asociados
  end

  def set_legalpersona
      @legalpersona = LegalPersona.find(params[:id])
  end

  def legal_persona_params
    if params['legal_persona']
      params.require(:legal_persona).permit(:rut, :name, :fantasy_name, :alias, :web, :acciones, :total)
    else
      params.permit(:rut, :name, :fantasy_name, :alias, :web, :acciones, :total)
    end
  end

end
