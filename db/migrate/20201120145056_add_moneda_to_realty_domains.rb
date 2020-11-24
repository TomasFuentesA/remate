class AddMonedaToRealtyDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :type_currency, :string
  end
end
