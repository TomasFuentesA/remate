class CreateLegalRepresents < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_represents do |t|
      t.string :name
      t.string :rut

      t.timestamps
    end
  end
end
