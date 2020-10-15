class AddColumnToLegalRepresents < ActiveRecord::Migration[5.2]
  def change
    add_column :legal_represents, :type_represents, :string
  end
end
