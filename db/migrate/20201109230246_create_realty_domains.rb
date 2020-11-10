class CreateRealtyDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_domains do |t|
      t.string :type_modality
      t.integer :price
      t.date :date_posetion

      t.timestamps
    end
  end
end
