class RegionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
    @region.provinces.build
    @region.provinces.build.communes.build
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

  def comuna
  end

  def update
    @region.update(region_params)
    redirect_to regions_path
  end

  def destroy
    @region.destroy
    redirect_to regions_path
  end

  def import
   Region.my_import(params[:file])
  redirect_to regions_path, notice: "Successfully Imported Data!!!"
 end

  private

  def region_params
    params.require(:region).permit(:name, :number_region,:file , :provinces_attributes => [:id,:name,
    :communes_attributes => [:id,:name,:cod_treasury,:conara_sii]]
  )
  end



end
