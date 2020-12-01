class AddFechaCeseToLegalPersona < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_personas, :fecha_cese, :date
  end
end
