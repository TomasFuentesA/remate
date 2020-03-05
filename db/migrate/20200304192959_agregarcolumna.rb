class Agregarcolumna < ActiveRecord::Migration[5.2]
  def change
    add_column :provinces , :region_id, :integer
  end
end
