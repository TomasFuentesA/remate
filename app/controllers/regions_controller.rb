class RegionsController < ApplicationController
  
  load_and_authorize_resource
  before_action :set_region, only: [:edit,:show,:destroy]
  before_action :display_values, only: [:show]

  def index
    @regions = Region.order("name").page(params[:page]).per_page(10)
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

  def display_values
    @able = @region
    @name = @able.name
    @number_region = @able.number_region
  end

  def set_region
    @region = Region.find(params[:id])

  end

  def region_params
    params.require(:region).permit(:name, :number_region,:file , :provinces_attributes => [:id,:name,
    :communes_attributes => [:id,:name,:cod_treasury,:conara_sii]]
  )
  end



end
