class RemoveEmailCFromEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :email_c, :string
  end
end
