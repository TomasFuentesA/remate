class AddForeignKeyToLegalRepresents < ActiveRecord::Migration[5.2]
  def change
    add_reference :legal_represents, :legal_personas, foreign_key: true
  end
end
