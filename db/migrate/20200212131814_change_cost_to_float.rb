class ChangeCostToFloat < ActiveRecord::Migration[5.2]
  def change
     change_column :auctions, :cost, :float
  end
end
