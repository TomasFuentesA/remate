class AddRealtyColumnToRealtyDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :realty_id, :integer
  end
end
