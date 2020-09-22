class RemoveJudgementFromAuctionrecord < ActiveRecord::Migration[5.2]
  def change
    remove_reference :auctionrecords, :judgement, foreign_key: true
  end
end
