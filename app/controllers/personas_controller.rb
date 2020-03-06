class PersonasController < ApplicationController
  def index
    @personas = Persona.all
  end

  def new
    @persona = Persona.new
  end

  def create
    @persona = Persona.new(persona_params)
    @persona.save
    redirect_to personas_index_path
  end


  def edit
      @persona = Persona.find(params[:id])
  end

  def show
      @persona = Persona.find(params[:id])
  end

  private
  def persona_params
      params.require(:persona).permit(:rut, :name, :name2, :last_name1, :last_name2,:e_civil, :profesion, :nacionality, :passport)
  end
end
