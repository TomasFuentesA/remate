class AddDatetimesColumnToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :warranty_date, :date
    add_column :auctions, :warranty_time, :time
  end
end
