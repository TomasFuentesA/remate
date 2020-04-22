class AuctionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_auction, only: [:show,:edit,:destroy]
  before_action :set_auctionnotice, only: [:modal, :new]


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



  end



  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      @auction.auctionnotice.update(status: 3)
    end
    redirect_to auctions_path, notice: @auction.errors
  end

  def show
  end

  def edit
  end

  def update
    @auction.update(auction_params)
    redirect_to auctions_path
  end

  def destroy
      @auction.auctionnotice.update(status: 0)
      @auction.destroy


      #flash[:notice] = "remate #{@auction.inspect} Eliminado con exito"
      redirect_to auctions_path

    #flash[:notice] = "remate #{@auction} no se pudo eliminar"


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


  def set_auctionnotice
    @auctionnotice = Auctionnotice.find(params[:auctionnotice_id])
  end

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.require(:auction).permit(:name, :date, :hour, :fee, :warranty,
      :minimum, :total_minimum, :cost, :uf, :pesos, :court_id, :lyrics, :number, :year,:judgement_id,
      :realty_id, :auctionnotice_id,:status,
      :judgement_attributes =>[:id,:type_judgement,
       :parts_attributes => [:id,:name,:part1,:part2,:partes]]
         )
  end

end
