class RemoveForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :auctions,:courts
    remove_foreign_key :parts,:auctions
    remove_index :auctions, :court_id
    remove_index :parts, :auction_id


  end
end
