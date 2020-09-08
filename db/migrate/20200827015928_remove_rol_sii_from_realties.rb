class RemoveRolSiiFromRealties < ActiveRecord::Migration[5.2]
  def change
    remove_column :realties, :rol_sii, :integer
  end
end
