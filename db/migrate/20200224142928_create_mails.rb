class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.string :rut
      t.string :maila
      t.string :mailb
      t.string :mailc

      t.timestamps
    end
  end
end
