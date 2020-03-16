class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :judgements,:auctions
    remove_index "judgement_id",  name: "index_auctions_on_judgement_id"
  end
end
