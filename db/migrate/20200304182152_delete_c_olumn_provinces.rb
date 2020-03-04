class DeleteCOlumnProvinces < ActiveRecord::Migration[5.2]
  def change
    remove_column :provinces , :region_id
  end
end
