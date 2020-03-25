class AuctionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource


  def index
      @auctions = Auction.order(date: :desc,hour: :desc).page(params[:page]).per_page(6)
      @search = Auction.search(params[:q])
      if @search
        @auctions = @search.result
      end


  end

  def search
    index
    render :index
  end

  def new
    @auction = Auction.new
    @auction.judgements.build.parts.build
    @auctionnotice = Auctionnotice.find(params[:auctionnotice_id])

  end



  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      @auction.auctionnotice.update(status: 3)
    end
    redirect_to auctions_path, notice: @auction.errors
  end

  def show
    @auction = Auction.find(params[:id])

  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction.update(auction_params)
    redirect_to auctions_path
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path
  end

  def auctions
      auction = Auctionnotice.find(params[:id])
  end

  def in_progress
     @auctions = Auction.where(status: 0)
  end

  def suspendend
     @auctions = Auction.where(status: 1)
  end

  def discarded
     @auctions = Auction.where(status: 2)
  end


  def auctions_in_progress
      auction = Auction.find(params[:id])
      auction.update(status: 0)
      redirect_to auctions_path
  end

  def auctions_suspendend
      auction = Auction.find(params[:id])
      auction.update(status: 1)
      redirect_to auctions_path
  end

  def auctions_discarded
      auction = Auction.find(params[:id])
      auction.update(status: 2)
      redirect_to auctions_path
  end





  private

  def auction_params
    params.require(:auction).permit(:name, :date, :hour, :fee, :warranty,
      :minimum, :total_minimum, :cost, :uf, :pesos, :court_id, :lyrics, :number, :year,:judgement_id,
      :realty_id, :auctionnotice_id,:status,
      :judgements_attributes =>[:id,:type_judgement,
       :parts_attributes => [:id,:name,:part1,:part2,:partes]]
         )
  end

end
