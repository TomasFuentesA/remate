class NombrarColumna < ActiveRecord::Migration[5.2]
  def change
    rename_column :type_realties, :type,:tipo
  end

end
