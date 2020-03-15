class NaturalPersonasController < ApplicationController
  def index
    @naturalPersonas = NaturalPersona.all
  end

  def new
    @naturalpersona = NaturalPersona.new
  end

  def create
    @naturalpersona = NaturalPersona.new(naturalpersona_params)
    @naturalpersona.save
    redirect_to naturalpersonas_index_path
  end


  def edit
      @naturalpersona = NaturalPersona.find(params[:id])
  end

  def show
      @naturalpersona = NaturalPersona.find(params[:id])
  end

  private
  def naturalpersona_params
      params.require(:naturalpersona).permit(:rut, :name, :name2, :last_name1, :last_name2, :e_civil, :profesion, :nacionality, :passport)
  end

end