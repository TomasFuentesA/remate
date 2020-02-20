class CambiarColumnaTotalMinimun < ActiveRecord::Migration[5.2]
  def change
    change_column :auctions , :minimum , :float
  end
end
