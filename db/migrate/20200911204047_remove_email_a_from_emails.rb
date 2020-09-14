class RemoveEmailAFromEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :email_a, :string
  end
end
