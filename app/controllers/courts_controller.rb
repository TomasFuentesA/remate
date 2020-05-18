class CourtsController < ApplicationController
  load_and_authorize_resource
  before_action :set_court, only: [:edit,:show,:destroy]
  before_action :display_values, only: [:show]

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
  def display_values
    @able = @court
    @name = @able.name
    @rut = @able.rut
    @address = @able.address
    @phone = @able.phone 
    @account = @able.account 
  end

  def set_court
    @court = Court.find(params[:id])

  end

  def court_params
    params.require(:court).permit(:name, :rut, :address, :phone, :account)
  end

end
