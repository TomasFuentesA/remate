class AddPrecioUfToRealtyDomain < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :precio_uf, :integer
  end
end
