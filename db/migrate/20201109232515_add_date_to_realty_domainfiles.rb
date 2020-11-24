class AddDateToRealtyDomainfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domainfiles, :date, :date
  end
end
