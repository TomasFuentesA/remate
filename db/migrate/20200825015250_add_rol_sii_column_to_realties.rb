class AddRolSiiColumnToRealties < ActiveRecord::Migration[5.2]
  def change
    add_column :realties, :rol_sii, :integer
  end
end
