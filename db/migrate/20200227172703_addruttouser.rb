class Addruttouser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :rut, :string
  end
end
