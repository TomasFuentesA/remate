class AuctionnoticesController < ApplicationController

  load_and_authorize_resource

  def index
    @auctionnotices = Auctionnotice.all
  end

  def new
    @auctionnotice = Auctionnotice.new
  end

  def create
    @auctionnotice = Auctionnotice.new(auctionnotice_params)
    @auctionnotice.save
    redirect_to auctionnotices_path
  end

  def show
  end

  def edit
  end

  def update
    @auctionnotice.update(auctionnotice_params)
    redirect_to auctionnotices_path
  end

  def destroy
    @auctionnotice.destroy
    redirect_to auctionnotices_path
  end

  def action_selection
      auction = Auctionnotice.find(params[:id])
      auction.update(status: 1)
      redirect_to auctionnotices_selected_path
  end

  def pending
     @auctionnotices = Auctionnotice.where(status: 0)
  end

  def selected
     @auctionnotices = Auctionnotice.where(status: 1)
  end

  def rejected
     @auctionnotices = Auctionnotice.where(status: 2)
  end

  def action_rejection
      auction = Auctionnotice.find(params[:id])
      auction.update(status: 2)
      redirect_to auctionnotices_rejected_path
  end

 

  private

  def auctionnotice_params
    params.require(:auctionnotice).permit(:name, :status)
  end

end
