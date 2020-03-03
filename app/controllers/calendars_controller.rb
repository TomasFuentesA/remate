class CalendarsController < ApplicationController
  def index
    @auctions = Auction.all
    @auctions_by_date = @auctions.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end



  private

  def auction_params
    params.require(:auction).permit(:name, :date, :hour, :fee, :warranty, :minimum, :total_minimum, :cost, :uf, :pesos, :court_id, :lyrics, :number, :year, :realty_id, :auctionnotice_id, :status)
  end
