class AuctionnoticesController < ApplicationController
  
  load_and_authorize_resource

  #crud auctionnotice

  def index
    @auctionnotices = Auctionnotice.all
    @search = Auctionnotice.search(params[:q])
    if @search
      @auctionnotices = @search.result
    end

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
    @auctionnotice = Auctionnotice.find(params[:id])

  end

  def edit
    @auctionnotice = Auctionnotice.find(params[:id])

  end
  def is_select
    @auctionnotice = Auctionnotice.find(params[:id])
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

  def auctionnotice_params
    params.require(:auctionnotice).permit(:name, :status, :auction, :realty_id)
  end

end
