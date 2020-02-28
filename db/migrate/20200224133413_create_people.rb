class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :rut
      t.integer :actividad_id
      t.string :last_name1
      t.string :last_name2
      t.integer :phone_id
      t.integer :mail_id
      t.string :direction_id
      t.string :photo
      t.string :e_civil
      t.string :profesion
      t.date :birth_date
      t.string :nacionality
      t.string :passport
      t.integer :job_id

      t.timestamps
    end
  end
end
