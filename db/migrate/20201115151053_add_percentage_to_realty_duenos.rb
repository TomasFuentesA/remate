class AddPercentageToRealtyDuenos < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_duenos, :percentage, :integer
  end
end
