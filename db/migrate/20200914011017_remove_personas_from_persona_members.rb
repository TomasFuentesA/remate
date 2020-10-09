class RemovePersonasFromPersonaMembers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :persona_members, :persona, foreign_key: true
  end
end
