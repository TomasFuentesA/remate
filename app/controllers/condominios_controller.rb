class CondominiosController < ApplicationController

  load_and_authorize_resource

  def index
    @condominios = Condominio.all
  end

  def new
    @condominio = Condominio.new
  end

  def create
    @condominio = Condominio.new(condominio_params)
    @condominio.save
    redirect_to condominios_path
  end

  def show
      @condominio = Condominio.find(params[:id])
  end

  def edit
    @condominio = Condominio.find(params[:id])
  end


  private

  def condominio_params
    params.require(:condominio).permit(:name, :address, :commune_id, :persona_id, :legal_persona_id )

  end

  end
