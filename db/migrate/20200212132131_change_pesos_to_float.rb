class ChangePesosToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :auctions, :pesos, :float
  end
end
