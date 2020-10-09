class RemoveRutFromEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :rut, :string
  end
end
