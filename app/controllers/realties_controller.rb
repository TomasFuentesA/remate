class RealtiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_hash , only: [:show,:new]
  before_action :set_realty , only: [:edit,:show,:destroy]


  def index
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
    if @realty.save
      respond_to do |format|
        format.js
        end
    else
      format.js
    end
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
    respond_to do |format|
      format.js
      format.html {redirect_to realties_path, notice: "#{@realty.name_realty} eliminada exitosamente" }
      format.json {head :no_content }
    end

  end

  

  def searchFilterData 
    @param = "%"+params[:q]+"%"
    #Realty.where("concat( number_unit , name_realty, population_villa, street) like ?",@param)
    @realty = Realty.joins(:commune).where("lower(concat( number_unit , name_realty, population_villa, street, communes.name)) like ?",@param)
    render json: @realty
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
       :type_property_id, :name_realty, :fiscal_destination, characteristic_attributes: [ :m2_land, :m2_built , :material], type_realty_attributes: [:tipo,:comment] )
  end


end
