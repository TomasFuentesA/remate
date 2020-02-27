class AuctionlistingsController < ApplicationController
  before_action :authenticate_user!
  #before_action :find_auctionlisting, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @auctionlistings = Auctionlisting.all
  end

  def new
    @auctionlisting = Auctionlisting.new
  end

  def create
    @auctionlisting = Auctionlisting.new(auctionlisting_params)
    @auctionlisting.save
    @auctionlisting.separation_paragraphs
    redirect_to auctionlistings_path
  end

  def show
  end

  def edit
  end

  def update
    @auctionlisting.update(auctionlisting_params)
    redirect_to auctionlistings_path
  end

  def destroy
    @auctionlisting.destroy
    redirect_to auctionlistings_path
  end

  private

  def auctionlisting_params
    params.require(:auctionlisting).permit(:name, :attached)
  end



end
