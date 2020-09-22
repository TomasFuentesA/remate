class CreateComprador < ActiveRecord::Migration[5.2]
  def change
    create_table :compradors do |t|
      t.integer :persona_id
      t.integer :acciones
      t.integer :percentage
      t.references :domain_rols, foreign_key: true
    end
  end
end
