class AddValorToPersonaMember < ActiveRecord::Migration[5.2]
  def change
    add_column :persona_members, :valor, :integer
  end
end
