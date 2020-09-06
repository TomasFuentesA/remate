class CondominiosController < ApplicationController
  load_and_authorize_resource

  before_action :set_legal_persona_id_default, only: :create

  def set_legal_persona_id_default
    if params[:condominio] && params[:condominio][:legal_persona_id].empty?
      params[:condominio][:legal_persona_id] = 0
        
    end
  end

  def index
    @legalpersonas = LegalPersona.all
    @condominios = Condominio.all
  end

  def new
    @condominio = Condominio.new

  end

  def create
    @condominio = Condominio.new(condominio_params)
    if @condominio.valid?
      @condominio.save
      respond_to do |format|
        format.js
        format.html {redirect_to condominios_path, notice: "ingresado exitosamente" }
        format.json {head :no_content }
      end
    else
      flash[:errors] = @condominio.errors.full_messages
      redirect_to new_condominio_path
    end
  end

  def show
    @legalpersonas = LegalPersona.all
    @condominio = Condominio.find(params[:id])
  end

  def edit
    @legalpersonas = LegalPersona.all
    @condominio = Condominio.find(params[:id])
  end

  def update
    @condominio.update(condominio_params)
    respond_to do |format|
      format.js
      format.html {redirect_to condominios_path, notice: "actualizado exitosamente" }
      format.json {head :no_content }
    end
  end



  def destroy
    @condominio.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to condominios_path, notice: "eliminado exitosamente" }
      format.json {head :no_content }
    end
  end


  
    private


    def condominio_params
      begin
        params.require(:condominio).permit(:name, :condominio_id, :commune_id, :address, :legal_persona_id)
      rescue Exception => error
        params.permit(:name, :condominio_id, :commune_id, :address, :legal_persona_id)
      end
    end
  end
