class AddPercentageToRealtyDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :percentage, :integer
  end
end
