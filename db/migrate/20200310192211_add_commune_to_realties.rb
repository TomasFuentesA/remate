class AddCommuneToRealties < ActiveRecord::Migration[5.2]
  def change
    remove_column :realties, :province_id, :integer
    remove_column :realties, :region_id, :integer
    remove_column :realties, :commune_id, :integer
    add_reference :realties, :commune, foreign_key: true
  end
end
