class CourtsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courts = Court.order("name").page(params[:page]).per_page(10)
  end

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(court_params)
    @court.save
    redirect_to courts_path
  end

  def show
  end

  def edit
  end

  def update
    @court.update(court_params)
    redirect_to courts_path
  end

  def destroy
    @court.destroy
    redirect_to courts_path
  end

  private

  def court_params
    params.require(:court).permit(:name, :rut, :address, :phone, :account)
  end

end
