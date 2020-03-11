class AddRegionToProvinces < ActiveRecord::Migration[5.2]
  def change
    remove_column :regions , :province_id
    remove_column :provinces , :region_id
    remove_column :provinces , :province_id
    remove_column :communes , :province_id
    remove_column :communes , :region_id
    add_reference :provinces, :region, foreign_key: true
    add_reference :communes, :province, foreign_key: true
  end
end
