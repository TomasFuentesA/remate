class AddLegalPersonasColumnToCondominios < ActiveRecord::Migration[5.2]
  def change
    add_column :condominios, :legal_persona_id, :integer, null: true
  end
end
