class Agregarregion < ActiveRecord::Migration[5.2]
  def change
    add_column :realties, :province_id, :integer
  end


end
