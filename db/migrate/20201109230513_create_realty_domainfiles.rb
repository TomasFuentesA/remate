class CreateRealtyDomainfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_domainfiles do |t|
      t.string :file_name
      t.string :observation

      t.timestamps
    end
  end
end
