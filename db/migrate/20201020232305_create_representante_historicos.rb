class CreateRepresentanteHistoricos < ActiveRecord::Migration[5.2]
  def change
    create_table :representante_historicos do |t|
      t.integer :persona_id
      t.date :entrada
      t.date :salida
      t.integer :legal_persona_id

      t.timestamps
    end
  end
end
