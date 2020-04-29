class CreateCondominios < ActiveRecord::Migration[5.2]
  def change
    create_table :condominios do |t|
      t.string :name
      t.references :persona, foreign_key: true
      t.references :legal_persona, foreign_key: true
      t.references :realty, foreign_key: true
      t.references :commune, foreign_key: true

      t.timestamps
    end
  end
end
