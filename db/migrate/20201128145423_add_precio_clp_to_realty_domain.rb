class AddPrecioClpToRealtyDomain < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :precio_clp, :integer
  end
end
