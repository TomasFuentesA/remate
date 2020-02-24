class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.string :rut
      t.string :directiona
      t.string :directionb
      t.string :directionc

      t.timestamps
    end
  end
end
