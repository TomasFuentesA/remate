class AddColumnToHistoricos < ActiveRecord::Migration[5.2]
  def change
    add_column :historicos, :valor, :integer
    add_column :historicos, :acciones, :integer
  end
end
