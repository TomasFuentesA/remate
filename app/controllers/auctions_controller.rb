class AuctionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_auction, only: [:show,:edit,:destroy]
  before_action :set_auctionnotice, only: [:new]

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
  end

  def create
    @auction = Auction.new(auction_params)
    Rails.logger.info (auction_params)
      if @auction.save
         @auction.auctionnotice.update(status: 3)
     end
    redirect_to auctions_path
  end

  def show
    Rails.logger.info "prueba show"
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
      respond_to do |format|
        format.js
        format.html {redirect_to auctions_path, notice: "#{@auction.name} eliminado exitosamente." }
        format.json {head :no_content }
      end
      #flash[:notice] = "remate #{@auction.inspect} Eliminado con exito"
      

    #flash[:notice] = "remate #{@auction} no se pudo eliminar"


  end



  def auctions
      Rails.logger.info "prueba auction"
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
    @auction = Auction.new
    @realty = Realty.new
    @auctionnotice = Auctionnotice.find(params[:auctionnotice_id])
    @realty.build_type_realty
    #@auction.build_judgement
  end

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.require(:auction).permit(:name, :date, :hour, :fee, :warranty,
      :minimum, :total_minimum, :cost,
       :uf, :pesos, :court_id, :lyrics, :number, :year,
        :realty_id, :auctionnotice_id,:status,
        :judgement_attributes => [:id, :type_judgement, :lyrics, :number, :year,:demandante,:demandado,:court_id, :auction_id, :rol_trial]
       )
  end

end
