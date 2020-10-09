class AddTypeMemberToPersonaMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :persona_members, :type_member, :string
  end
end
