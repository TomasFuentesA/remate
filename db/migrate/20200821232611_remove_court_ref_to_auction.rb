class RemoveCourtRefToAuction < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :auctions, column: :court_id
  end
end
