class CommunesController < ApplicationController
  
  load_and_authorize_resource

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

  def commune_params
    params.require(:commune).permit(:name, :province_id )
  end

end
