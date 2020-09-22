class AddAuctionToAuctionrecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :auctionrecords, :auction, foreign_key: true
  end
end
