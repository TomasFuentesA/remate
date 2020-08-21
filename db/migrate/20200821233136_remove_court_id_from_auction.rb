class RemoveCourtIdFromAuction < ActiveRecord::Migration[5.2]
  def change
    remove_column :auctions, :court_id, :integer
  end
end
