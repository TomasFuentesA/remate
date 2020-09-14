class AddFileNameToAuctionrecord < ActiveRecord::Migration[5.2]
  def change
    add_column :auctionrecords, :file_name, :varchar
  end
end
