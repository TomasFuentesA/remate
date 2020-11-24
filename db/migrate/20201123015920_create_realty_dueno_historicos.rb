class CreateRealtyDuenoHistoricos < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_dueno_historicos do |t|
      t.integer :persona_id
      t.integer :realty_id
      t.string :type_member
      t.date :salida
      t.date :entrada

      t.timestamps
    end
  end
end
