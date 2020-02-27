class Renombrarcolumnalatituduser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Latitude, :latitude
  end
end
