class CreateRealtyInscriptionfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_inscriptionfiles do |t|
      t.string :file_name
      t.string :observation
      t.date :date
      t.references :realty_inscription, foreign_key: true

      t.timestamps
    end
  end
end
