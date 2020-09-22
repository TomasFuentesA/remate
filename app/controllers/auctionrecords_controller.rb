class AuctionrecordsController < ApplicationController
  
  load_and_authorize_resource
  before_action :set_auctionrecord, only:  [:show,:edit]

  def index
    @auctionrecords = Auctionrecord.all
  end

  def new
    @auctionrecord = Auctionrecord.new
  end

  def create
    @auctionrecord = Auctionrecord.new(auctionrecord_params)
    @auctionrecord.save
    redirect_to auctionrecords_path
  end

  def show
  end

  def edit
  end

  def update
    @auctionrecord.update(auctionrecord_params)
    redirect_to auctionrecords_path
  end 



  def destroy
    @auctionrecord.destroy
    redirect_to auctionrecords_path
  end

  private

  def set_auctionrecord
    @auctionrecord = Auctionrecord.find(params[:id])
  end

  def auctionrecord_params
    params.require(:auctionrecord).permit(:auction_id, :date, :awardamount, :file_name)

  end

end


