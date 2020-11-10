class CreateRealtyInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_inscriptions do |t|
      t.integer :foja
      t.integer :number
      t.integer :year
      t.string :cbrs
      t.date :date
      t.references :realty_domains, foreign_key: true

      t.timestamps
    end
  end
end
