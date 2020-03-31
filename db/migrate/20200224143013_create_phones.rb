class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :rut
      t.string :phone_a
      t.string :phone_b
      t.string :phone_c
      t.belongs_to :phoneable, polymorphic: true

      t.timestamps
    end
    add_index :phones, [:phoneable_id, :phoneable_type]
  end
end
