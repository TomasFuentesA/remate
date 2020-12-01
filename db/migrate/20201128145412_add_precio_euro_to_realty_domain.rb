class AddPrecioEuroToRealtyDomain < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :precio_euro, :integer
  end
end
