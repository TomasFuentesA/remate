class RemoveRelationCourt < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :judgements,:courts
    remove_index :judgements, :court_id
    end
end
