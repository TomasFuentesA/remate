class AddPrecioUsdToRealtyDomain < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :precio_usd, :integer
  end
end
