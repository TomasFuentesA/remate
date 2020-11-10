class CreateRealtyDomainrols < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_domainrols do |t|
      t.string :type_member
      t.string :type_rol
      t.integer :persona_id
      t.integer :precio
      t.references :realty_domains, foreign_key: true

      t.timestamps
    end
  end
end
