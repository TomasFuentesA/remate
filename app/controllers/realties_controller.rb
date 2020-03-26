class RealtiesController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!


  def index
=begin
      if params[:latitude].present? && params[:longitude].present?
        @realties = Realty.near(
          [params[:latitude], params[:longitude]],
          200,
          units: :km
        )
      elsif current_user.present?
        @realties = Realty.near(
          current_user.address,
          1000,
          units: :km
        )
      else
        @realties = Realty.all
      end
=end
      @realties = Realty.all
      @hash = Gmaps4rails.build_markers(@realties) do |realty, marker|
        marker.lat realty.latitude
        marker.lng realty.longitude
      end

  end

  def new
      @realty = Realty.new
      @realty.build_characteristic
      @realty.build_type_realty
      @hash = Gmaps4rails.build_markers(@realty) do |realty, marker|
      marker.lat realty.latitude
      marker.lng realty.longitude
      end
  end

  def create
    @realty = Realty.new(realty_params)
    @realty.save
    redirect_to realties_path
end



  def show
      @realty = Realty.find(params[:id])
      @hash = Gmaps4rails.build_markers(@realty) do |realty, marker|
      marker.lat realty.latitude
      marker.lng realty.longitude
    end
  end

  def edit
    @realty = Realty.find(params[:id])
  end

  def update
    @realty.update(realty_params)
    redirect_to realties_path
  end

  def destroy
    @realty.destroy
    redirect_to realties_path
  end

  def address
  end

  private

  def realty_params
    params.require(:realty).permit(:street, :number_unit, :commune_id, :population_villa, :unit_estate, :apple, :property, :latitude, :longitude, :address,
      :street_type_id, :type_property_id,
      characteristic_attributes: [:id,:m2_land,:m2_built,:material,:built_year,:_destroy],

  type_realty_attributes: [:id,:tipo,:ambient,:bathroom,:bedroom,:parking_lot,:cellar,:_destroy] )
  end


end
