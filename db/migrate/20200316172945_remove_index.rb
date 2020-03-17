class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :judgements,:auctions
    remove_index :auctions, :judgement_id
  end
end
