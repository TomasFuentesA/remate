class CreateLegalPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_people do |t|
      t.string :rut
      t.string :name
      t.string :fantasy_name
      t.string :alias
      t.string :web

      t.timestamps
    end
  end
end
