class RemoveRutFromPhones < ActiveRecord::Migration[5.2]
  def change
    remove_column :phones, :rut, :string
  end
end
