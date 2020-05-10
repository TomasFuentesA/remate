class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :rut
      t.string :email_a
      t.string :email_b
      t.string :email_c
      t.belongs_to :emailable, polymorphic: true
      t.timestamps
    end
    add_index :emails, [:emailable_id, :emailable_type]
  end



end
