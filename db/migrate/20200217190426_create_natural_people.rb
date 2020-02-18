class CreateNaturalPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :natural_people do |t|
      t.string :rut
      t.string :name
      t.string :apellido_pat
      t.string :apellido_mat
      t.integer :phone_id
      t.integer :mail_id
      t.integer :direction_id
      t.string :photo
      t.string :e_civil
      t.string :profesion
      t.date :fecha_nac
      t.string :alias
      t.string :nacionality
      t.string :passport
      t.integer :job_id

      t.timestamps
    end
  end
end
