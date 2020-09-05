class CondominiosController < ApplicationController
  load_and_authorize_resource


  before_action :set_last_updated_by_param, only: :create

  
  def set_last_updated_by_param
    Rails.logger.info "Entro al set_last"
    if params[:condominio] && params[:condominio][:legal_persona_id].blank?
      params[:condominio][:legal_persona_id] = 1
      Rails.logger.info "Lo deja en NIL"
        
    end
  end



  def index
    @condominios = Condominio.all
  end

  def new
    @condominio = Condominio.new
  end

  def create
    @condominio = Condominio.new(condominio_params)
    if @condominio.save
      redirect_to @condominio
    else
      render 'new'
    end
  end

  def show
    @condominio = Condominio.find(params[:id])
  end

  def edit
    @condominio = Condominio.find(params[:id])
  end

  def update
    @condominio.update(condominio_params)
    redirect_to condominios_path
  end



  def destroy
    @condominio.destroy
    redirect_to condominios_path
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
