class Revertchangedate < ActiveRecord::Migration[5.2]
  def change
    change_column :auctions , :date ,'date USING CAST(date AS date)'
  end
end
