class AddAccionesToLegalPersona < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_personas, :acciones, :integer
  end
end
