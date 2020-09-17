class CountriesController < ApplicationController

    load_and_authorize_resource
    before_action :set_country, only:  [:show,:edit]
  
    def index
      @countries = Country.all
    end
  
    def new
      @country = Country.new
    end
  
    def create
      @country = Country.new(country_params)
      @country.save
      redirect_to countries_path
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @country.update(country_params)
      redirect_to countries_path
    end
  
  
  
    def destroy
      @country.destroy
      redirect_to countries_path
    end
  
    private
  
    def set_country
      @country = Country.find(params[:id])
    end
  
    def country_params
      params.require(:country).permit(:name)
  
    end
  
end
