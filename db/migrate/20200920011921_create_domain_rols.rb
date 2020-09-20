class CreateDomainRols < ActiveRecord::Migration[5.2]
  def change
    create_table :domain_rols do |t|
      t.string :type_member
      t.string :type_rol
      t.integer :persona_id
      t.references :domain, foreign_key: true

      t.timestamps
    end
  end
end
