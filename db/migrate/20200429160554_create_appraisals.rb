class CreateAppraisals < ActiveRecord::Migration[5.2]
  def change
    create_table :appraisals do |t|
      t.date :date
      t.string :entity
      t.float :price_uf
      t.float :price_clp
      t.float :price_usd
      t.string :observation
      t.references :realty, foreign_key: true

      t.timestamps
    end
  end
end
