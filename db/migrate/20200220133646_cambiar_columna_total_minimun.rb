class CambiarColumnaTotalMinimun < ActiveRecord::Migration[5.2]
  def up
    change_column :auctions , :minimum , :float
  end
  def down

  end
end
