class AddRegionToProvinces < ActiveRecord::Migration[5.2]
  def change

    remove_column :provinces , :region_id, :integer
    remove_column :provinces , :province_id, :integer
    remove_column :communes , :province_id, :integer
    remove_column :communes , :region_id, :integer
    add_reference :provinces, :region, foreign_key: true
    add_reference :communes, :province, foreign_key: true
  end
end
