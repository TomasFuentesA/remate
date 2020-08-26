class RemovePersonasFromCondominios < ActiveRecord::Migration[5.2]
  def change
    remove_reference :condominios, :persona, foreign_key: true
  end
end
