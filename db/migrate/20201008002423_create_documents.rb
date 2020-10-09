class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :domain_title
      t.string :gp
      t.string :tax_appraisal
      t.references :realty, foreign_key: true

      t.timestamps
    end
  end
end
