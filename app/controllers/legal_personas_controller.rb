class LegalPersonasController < ApplicationController
  def index
    @legalPersonas = LegalPersona.all
  end

  def new
    @legalpersona = LegalPersona.new
  end

  def create
    @legalpersona = LegalPersona.new(legalpersona_params)
    @legalpersona.save
    redirect_to legalpersonas_index_path
  end


  def edit
      @legalpersona = LegalPersona.find(params[:id])
  end

  def show
      @legalpersona = LegalPersona.find(params[:id])
  end

  private
  def legalpersona_params
      params.require(:legalpersona).permit(:rut, :name, :fantasy_name, :alias, :web)
  end

end
