class AgregarBodegaToTypeRealty < ActiveRecord::Migration[5.2]
  def change
    add_column :type_realties, :bathroom, :integer
    add_column :type_realties, :parking_lot, :integer
    add_column :type_realties, :cellar, :integer
    add_column :type_realties, :bedroom, :integer
    add_column :type_realties, :ambient, :integer
  end
end
