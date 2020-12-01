class RemovePrecioClpFromRealtyDomain < ActiveRecord::Migration[5.2]
  def change
    remove_column :realty_domains, :precio_clp, :integer
  end
end
