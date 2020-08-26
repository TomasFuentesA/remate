class RemoveLegalPersonasFromCondominios < ActiveRecord::Migration[5.2]
  def change
    remove_reference :condominios, :legal_persona, foreign_key: true
  end
end
