class AddEmailToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :email, :string
  end
end
