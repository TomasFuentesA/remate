class RemoveEmailBFromEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :email_b, :string
  end
end
