class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.string :rut
      t.string :directiona
      t.string :directionb
      t.string :directionc
      t.belongs_to :directionable, polymorphic: true
      t.timestamps
    end
     add_index :directions, [:directionable_id, :directionable_type]
  end


end
