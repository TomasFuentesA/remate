class AddForeignKeyToInscriptionfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :inscriptionfiles, :inscription, foreign_key: true
  end
end
