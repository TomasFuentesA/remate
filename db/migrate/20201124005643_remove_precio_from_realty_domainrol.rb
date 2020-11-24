class RemovePrecioFromRealtyDomainrol < ActiveRecord::Migration[5.2]
  def change
    remove_column :realty_domainrols, :precio, :integer
  end
end
