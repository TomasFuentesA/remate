class AddEstadoToLegalPersona < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_personas, :estado, :string
  end
end
