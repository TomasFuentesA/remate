class MonedasController < ApplicationController

    load_and_authorize_resource
    before_action :set_moneda, only:  [:show,:edit]
  
    def index
      @monedas = Moneda.all
    end
  
    def new
      @moneda = Moneda.new
    end
  
    def create
      @moneda = Moneda.new(moneda_params)
      @moneda.save
      redirect_to monedas_path
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @moneda.update(moneda_params)
      redirect_to monedas_path
    end
  
  
  
    def destroy
      @moneda.destroy
      redirect_to monedas_path
    end
  
    private
  
    def set_moneda
      @moneda = Moneda.find(params[:id])
    end
  
    def moneda_params
      params.require(:moneda).permit(:name )
  
    end
  
end
