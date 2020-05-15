class CreateLegalPersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_personas do |t|
      t.string :rut
      t.string :name
      t.string :fantasy_name
      t.string :alias
      t.string :web
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

  end
  

end