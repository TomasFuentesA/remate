class RemoveDirectionAFromDirection < ActiveRecord::Migration[5.2]
  def change
    remove_column :directions, :directiona, :string
  end
end
