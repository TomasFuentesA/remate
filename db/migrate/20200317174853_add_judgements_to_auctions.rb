class AddJudgementsToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_reference :judgements, :auction, foreign_key: true, index: true
  end
end
