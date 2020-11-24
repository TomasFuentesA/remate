class CreateRealtyDuenos < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_duenos do |t|
      t.integer :persona_id
      t.integer :realty_id
      t.string :type_member

      t.timestamps
    end
  end
end
