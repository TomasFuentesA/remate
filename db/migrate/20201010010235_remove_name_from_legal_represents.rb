class RemoveNameFromLegalRepresents < ActiveRecord::Migration[5.2]
  def change
    remove_column :legal_represents, :name, :string
  end
end
