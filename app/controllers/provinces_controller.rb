class ProvincesController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @provinces = Province.all
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

  def province_params
    params.require(:province).permit(:name, :region_id )
  end


end
