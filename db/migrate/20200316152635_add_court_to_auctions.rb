class AddCourtToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_reference :auctions, :judgement, foreign_key: true, index: true
  end
end
