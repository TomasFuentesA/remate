class PersonasController < ApplicationController
  load_and_authorize_resource
  before_action :set_persona, only: [:edit,:show,:destroy]
  before_action :show_actions, only: [:show]
  before_action :set_job, only: [:edit]
  def index
    @personas = Persona.all
  end

  def new
    @persona = Persona.new
  end

  def create
    @persona = Persona.new(persona_params)
    if @persona.save
      redirect_to personas_path
    else
      render "new"
    end
  end


  def edit

  end

  def show

  end
  def update
    @persona.update(persona_params)
    redirect_to @persona

  end

  def destroy
    if @persona.present?
      @persona.destroy
      respond_to do |format|
        format.js
        format.html {redirect_to personas_path, notice: "Persona eliminada!" }
        format.json {head :no_content }
      end
    end
  end

  private

  def set_persona
    @persona = Persona.find(params[:id])
  end

  def set_job
    @persona.build_job
  end

  def show_actions
    @able = @persona
    @phones = @able.phones
    @emails = @able.emails
    @directions = @able.directions
    @activities = @able.activities
  end
  def persona_params
      params.require(:persona).permit(:rut, :name, :name2, :last_name1, :last_name2,:e_civil, :profesion, :nacionality, :passport, :birth_date,
      job_attributes: [:position,:salary,:business,:description])
  end
end
