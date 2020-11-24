class AddObservationColumnToRealtyDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :observation, :string
  end
end
