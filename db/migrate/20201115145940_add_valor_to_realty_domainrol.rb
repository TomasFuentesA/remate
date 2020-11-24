class AddValorToRealtyDomainrol < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domainrols, :valor, :integer
  end
end
