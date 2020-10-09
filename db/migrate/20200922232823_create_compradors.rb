class CreateCompradors < ActiveRecord::Migration[5.2]
  def change
    create_table :compradors do |t|
      t.integer :persona_id
      t.integer :acciones
      t.integer :percentage
      t.string :type_member
      t.timestamps
    end
  end
end
