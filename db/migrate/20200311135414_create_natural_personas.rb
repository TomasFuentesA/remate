class CreateNaturalPersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :natural_personas do |t|
      t.string :rut
      t.string :name
      t.string :name2
      t.string :apellido_pat
      t.string :apellido_mat
      t.string :e_civil
      t.string :profesion
      t.date :fecha_nac
      t.string :alias
      t.string :nacionality
      t.string :passport

      t.timestamps
    end
  end
end
