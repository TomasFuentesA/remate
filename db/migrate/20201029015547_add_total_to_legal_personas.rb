class AddTotalToLegalPersonas < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_personas, :total, :integer
  end
end
