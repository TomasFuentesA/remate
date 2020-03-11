class CreateJudgements < ActiveRecord::Migration[5.2]
  def change
    create_table :judgements do |t|
      t.references :court, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
