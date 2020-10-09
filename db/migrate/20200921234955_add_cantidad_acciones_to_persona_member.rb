class AddCantidadAccionesToPersonaMember < ActiveRecord::Migration[5.2]
  def change
    add_column :persona_members, :acciones, :integer
  end
end
