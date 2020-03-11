class AddAuctionToJudgement < ActiveRecord::Migration[5.2]
  def change
    add_reference :judgements, :auction, foreign_key: true
    add_reference :courts, :judgement, foreign_key: true
    add_reference :parts, :judgement, foreign_key: true
  end
end
