class AddCondominiosColumnToRealties < ActiveRecord::Migration[5.2]
  def change
    add_column :realties, :condominio_id, :integer
  end
end
