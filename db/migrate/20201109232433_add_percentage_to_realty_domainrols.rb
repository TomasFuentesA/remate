class AddPercentageToRealtyDomainrols < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domainrols, :percentage, :integer
  end
end
