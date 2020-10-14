class AddColumnToPersonaMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :persona_members, :entrada, :date
  end
end
