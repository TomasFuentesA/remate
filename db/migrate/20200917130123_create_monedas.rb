class CreateMonedas < ActiveRecord::Migration[5.2]
  def change
    create_table :monedas do |t|
      t.string :name

      t.timestamps
    end
  end
end
