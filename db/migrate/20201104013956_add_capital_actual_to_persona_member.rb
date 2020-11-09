class AddCapitalActualToPersonaMember < ActiveRecord::Migration[5.2]
  def change
    add_column :persona_members, :capital_actual, :integer
  end
end
