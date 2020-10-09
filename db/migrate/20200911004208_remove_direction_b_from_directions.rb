class RemoveDirectionBFromDirections < ActiveRecord::Migration[5.2]
  def change
    remove_column :directions, :directionb, :string
  end
end
