class CreateCharacteristics < ActiveRecord::Migration[5.2]
  def change
    create_table :characteristics do |t|
      t.float :m2_land
      t.float :m2_built
      t.string :material
      t.date :built_year
      t.references :realty, foreign_key: true

      t.timestamps
    end
  end
end
