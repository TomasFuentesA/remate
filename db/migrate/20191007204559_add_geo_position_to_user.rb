class AddGeoPositionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :address, :string
  end
end
