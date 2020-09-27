class CommunesController < ApplicationController
  
  load_and_authorize_resource
  before_action :set_commune, only: [:edit,:show,:destroy]
  before_action :display_values, only: [:show]

  def index
    @communes = Commune.order("name").page(params[:page]).per_page(10)

  end

  def new
    @commune = Commune.new
  end

  def create
    @commune = Commune.new(commune_params)
    @commune.save
    redirect_to communes_path
  end

  def show
  end

  def edit
  end

  def update
    @commune.update(commune_params)
    redirect_to communes_path
  end

  def destroy
    @commune.destroy
    redirect_to communes_path
  end

  private
  def display_values
    @able = @commune
    @name = @able.name
    @province_id = @able.province_id
  end

  def set_commune
    @commune = Commune.find(params[:id])

  end

  def commune_params
    params.require(:commune).permit(:name, :province_id )
  end

end
