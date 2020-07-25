class AuctionnoticesController < ApplicationController
  before_action :find_params, only: [:show, :edit,:is_select]

  load_and_authorize_resource

  #crud auctionnotice

  def index
    @search = Auctionnotice.search(params[:q])
    if @search
      @auctionnotices = @search.result
    else
      @auctionnotices = Auctionnotice.all

    end


  end

  def new
    @auctionnotice = Auctionnotice.new
  end

  def create
    @auctionnotice = Auctionnotice.new(auctionnotice_params)
    if @auctionnotice.save
      redirect_to auctionnotices_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end
  def is_select
  end

  def update
    @auctionnotice.update(auctionnotice_params)
    redirect_to auctionnotices_path
  end

  def destroy
    if @auctionnotice.status == 2
      @auctionnotice.destroy
      redirect_to auctionnotices_path
    end
  end

  def discontinue
    Auctionnotice.update_all(status: 1)
    redirect_to auctionnotices_url
end





  ##actions to selection, rejected, pending and  joined

  def action_selection
      auction = Auctionnotice.find(params[:id])
      auction.update(status: 1)
      redirect_to auctionnotices_selected_path
  end

  def action_rejection
      auction = Auctionnotice.find(params[:id])
      auction.update(status: 2)
      redirect_to auctionnotices_pending_path
  end

##show auctionnotices by status


    def pending
       @auctionnotices = Auctionnotice.where(status: 0)
    end


    def selected
       @auctionnotices = Auctionnotice.where(status: 1)
    end

    def rejected
       @auctionnotices = Auctionnotice.where(status: 2)
    end

    def joined
       @auctionnotices = Auctionnotice.where(status: 3)
    end

  private
  def find_params
    @auctionnotice = Auctionnotice.find(params[:id])
  end

  def auctionnotice_params
    params.require(:auctionnotice).permit(:name, :status, :auction, :realty_id)
  end

end
