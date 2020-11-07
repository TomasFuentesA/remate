class AddPrecioToCompradors < ActiveRecord::Migration[5.2]
  def change
    add_column :compradors, :precio, :integer
  end
end
