class Agregarrovincia < ActiveRecord::Migration[5.2]
  def change
    add_column :provinces, :province_id, :integer
  end
end
