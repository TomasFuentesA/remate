class RemoveDirectionCFromDirections < ActiveRecord::Migration[5.2]
  def change
    remove_column :directions, :directionc, :string
  end
end
