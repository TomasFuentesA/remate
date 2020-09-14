class AddPersonaIdToPersonaMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :persona_members, :persona_id, :integer
  end
end
