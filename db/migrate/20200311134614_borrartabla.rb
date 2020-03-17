class Borrartabla < ActiveRecord::Migration[5.2]
  def change
    drop_table :legal_people  do |t|
      t.string "rut"
    t.string "name"
    t.string "fantasy_name"
    t.string "alias"
    t.string "web"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
    drop_table :natural_people  do |t|
      t.string "rut"
    t.string "name"
    t.string "apellido_pat"
    t.string "apellido_mat"
    t.integer "phone_id"
    t.integer "mail_id"
    t.integer "direction_id"
    t.string "photo"
    t.string "e_civil"
    t.string "profesion"
    t.date "fecha_nac"
    t.string "alias"
    t.string "nacionality"
    t.string "passport"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
