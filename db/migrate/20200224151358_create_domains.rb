class CreateDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :domains do |t|
      t.string :rut_owner
      t.string :type_modality
      t.integer :inscription_id
      t.integer :price
      t.date :date_posetion
      t.text :name_realty

      t.timestamps
    end
  end
end
