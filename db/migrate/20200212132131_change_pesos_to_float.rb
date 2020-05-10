class ChangePesosToFloat < ActiveRecord::Migration[5.2]
  def up
    change_column :auctions, :pesos, :float
  end
  def down

  end
end
