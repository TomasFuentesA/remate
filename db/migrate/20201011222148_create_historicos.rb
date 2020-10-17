class CreateHistoricos < ActiveRecord::Migration[5.2]
  def change
    create_table :historicos do |t|
      t.integer :persona_id
      t.string :type_member
      t.integer :legal_persona_id
      t.date :entrada
      t.date :salida

      t.timestamps
    end
  end
end
