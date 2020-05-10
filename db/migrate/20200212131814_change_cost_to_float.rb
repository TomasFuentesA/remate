class ChangeCostToFloat < ActiveRecord::Migration[5.2]
  def up
     change_column :auctions, :cost, :float
  end
  def down

  end
end
