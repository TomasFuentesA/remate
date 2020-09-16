class CreateInscriptionfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptionfiles do |t|
      t.string :file_name
      t.string :obs
      t.date :date
    end
  end
end
