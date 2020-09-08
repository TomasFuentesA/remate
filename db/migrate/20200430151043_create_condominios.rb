class CreateCondominios < ActiveRecord::Migration[5.2]
  def change
    create_table :condominios do |t|
      t.string :name
      t.string :address
      t.references :commune, foreign_key: true

    t.timestamps
    end
  end
end
