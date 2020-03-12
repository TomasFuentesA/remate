class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.integer :foja
      t.integer :number
      t.integer :year
      t.string :cbrs

      t.timestamps
    end
  end
end
