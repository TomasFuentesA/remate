class ProvincesController < ApplicationController
  
  load_and_authorize_resource
  before_action :set_province, only: [:edit,:show,:destroy]
  before_action :display_values, only: [:show]

  def index
    @provinces = Province.order("name").page(params[:page]).per_page(10)
  end

  def new
    @province = Province.new
  end

  def create
    @province = Province.new(province_params)
    @province.save
    redirect_to provinces_path
  end

  def show
  end

  def edit
  end

  def update
    @province.update(province_params)
    redirect_to provinces_path
  end

  def destroy
    @province.destroy
    redirect_to provinces_path
  end

  private

  def display_values
    @able = @province
    @name = @able.name
    @region_id = @able.region_id
  end

  def set_province
    @province = Province.find(params[:id])
  end

  def province_params
    params.require(:province).permit(:name, :region_id,:communes_attributes => [:id,:name,:cod_treasury,:conara_sii] )
  end

end
