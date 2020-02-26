class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :rut
      t.string :email_a
      t.string :email_b
      t.string :email_c

      t.timestamps
    end
  end
end
