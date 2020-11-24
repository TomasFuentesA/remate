class AddNotarioColumnToRealtyDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :notario_id, :integer
  end
end
