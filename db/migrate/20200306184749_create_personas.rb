class CreatePersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :personas do |t|
      t.string :name
      t.string :name2
      t.string :rut
      t.string :last_name1
      t.string :last_name2
      t.string :e_civil
      t.string :profesion
      t.date :birth_date
      t.string :nacionality
      t.string :passport

      t.timestamps
    end
  end
end
