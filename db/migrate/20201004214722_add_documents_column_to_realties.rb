class AddDocumentsColumnToRealties < ActiveRecord::Migration[5.2]
  def change
    add_column :realties, :domain_title, :string
    add_column :realties, :gp, :string
    add_column :realties, :tax_appraisal, :string
  end
end
