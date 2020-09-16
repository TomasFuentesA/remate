class BanksController < ApplicationController

    load_and_authorize_resource
  before_action :set_bank, only:  [:show,:edit]

  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    @bank.save
    redirect_to banks_path
  end

  def show
  end

  def edit
  end

  def update
    @bank.update(bank_params)
    redirect_to banks_path
  end



  def destroy
    @bank.destroy
    redirect_to banks_path
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name)

  end

end


