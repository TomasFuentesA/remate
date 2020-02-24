class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :rut
      t.string :phone_a
      t.string :phone_b
      t.string :phone_c

      t.timestamps
    end
  end
end
