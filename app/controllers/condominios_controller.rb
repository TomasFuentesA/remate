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
        params.require(:condominio).permit(:name, :condominio_id, :commune_id, :address)
      rescue Exception => error
        params.permit(:name, :condominio_id, :commune_id, :address)
      end
    end
  end
