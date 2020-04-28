class RealtiesController < ApplicationController
  load_and_authorize_resource


  before_action :set_hash , only: [:show,:new]
  before_action :set_realty , only: [:edit,:show,:destroy]





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
    @realty.build_type_realty
  end

  def create
    @realty = Realty.new(realty_params)
    @realty.inspect
    @realty.save
    redirect_to realties_path
end



  def show
  end

  def edit
    @realty.build_characteristic if @realty.characteristic.nil?
    @realty.build_type_realty if @realty.type_realty.nil?
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
  def set_realty
    @realty = Realty.find(params[:id])
  end

  def set_hash
    @hash = Gmaps4rails.build_markers(@realty) do |realty, marker|
    marker.lat realty.latitude
    marker.lng realty.longitude
    end
  end

  def realty_params
    params.require(:realty).permit(:street, :number_unit,:unit_estate,:street_type_id, :commune_id, :population_villa , :apple, :property, :latitude, :longitude, :address,
       :type_property_id, :name_realty, :fiscal_destination, characteristic_attributes: [:id, :m2_land, :m2_built , :material], type_realty_attributes: [:id,:tipo,:comment] )
  end


end
