class AddRealtiesReferencesToDirections < ActiveRecord::Migration[5.2]
  def change
    add_reference :directions, :realties, foreign_key: true
  end
end
