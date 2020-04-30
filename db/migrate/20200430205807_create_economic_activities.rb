class CreateEconomicActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :economic_activities do |t|
      t.string :name
      t.integer :codigo
      t.string :afecta_iva
      t.references :legal_persona, foreign_key: true

      t.timestamps
    end
  end
end
