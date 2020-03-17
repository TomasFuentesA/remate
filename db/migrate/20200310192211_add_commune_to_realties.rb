class AddCommuneToRealties < ActiveRecord::Migration[5.2]
  def change
    add_reference :realties, :commune, foreign_key: true
  end
end
