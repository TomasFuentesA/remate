class RegionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    @region.save
    redirect_to regions_path
  end

  def show
  end

  def edit
  end

  def update
    @region.update(region_params)
    redirect_to regions_path
  end

  def destroy
    @region.destroy
    redirect_to regions_path
  end

  private

  def region_params
    params.require(:region).permit(:name, :number_region )
  end



end
