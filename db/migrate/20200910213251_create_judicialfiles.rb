class CreateJudicialfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :judicialfiles do |t|
      t.date :date
      t.string :obs
      t.references :judgement, foreign_key: true

      t.timestamps
    end
  end
end
