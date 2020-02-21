class Cambiarformatofecha < ActiveRecord::Migration[5.2]
  def change
    change_column :auctions , :date , :string
  end
end
