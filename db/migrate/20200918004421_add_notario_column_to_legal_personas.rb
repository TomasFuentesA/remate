class AddNotarioColumnToLegalPersonas < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_personas, :notario, :string
  end
end
