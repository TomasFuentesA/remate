class AddPersonaIdToLegalRepresents < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_represents, :persona_id, :integer
  end
end
