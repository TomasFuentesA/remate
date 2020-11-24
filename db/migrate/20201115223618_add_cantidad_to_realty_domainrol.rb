class AddCantidadToRealtyDomainrol < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domainrols, :cantidad, :integer
  end
end
