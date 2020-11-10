class CreateRealtyCompradors < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_compradors do |t|
      t.integer :persona_id
      t.string :type_member
      t.integer :precio
      t.integer :percentage
      t.references :realty_domainrols, foreign_key: true

      t.timestamps
    end
  end
end
