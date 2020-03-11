class AddCommuneToRealties < ActiveRecord::Migration[5.2]
  def change
    remove_column :realties, :province_id
    remove_column :realties, :region_id
    remove_column :realties, :commune_id
    add_reference :realties, :commune, foreign_key: true
  end
end
