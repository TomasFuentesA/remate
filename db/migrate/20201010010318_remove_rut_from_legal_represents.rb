class RemoveRutFromLegalRepresents < ActiveRecord::Migration[5.2]
  def change
    remove_column :legal_represents, :rut, :string
  end
end
