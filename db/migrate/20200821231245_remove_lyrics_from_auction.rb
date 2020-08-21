class RemoveLyricsFromAuction < ActiveRecord::Migration[5.2]
  def change
    remove_column :auctions, :lyrics, :string
  end
end
