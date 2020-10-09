class RemoveRutFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :rut, :string
  end
end
