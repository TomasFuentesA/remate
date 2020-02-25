class Eliminatemails < ActiveRecord::Migration[5.2]
  def change
    drop_table :mails
  end
end
