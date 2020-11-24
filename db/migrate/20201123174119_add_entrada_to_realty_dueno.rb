class AddEntradaToRealtyDueno < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_duenos, :entrada, :date
  end
end
