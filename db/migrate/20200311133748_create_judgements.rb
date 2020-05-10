class CreateJudgements < ActiveRecord::Migration[5.2]

  def change
    create_table :judgements do |t|
      t.integer :type_judgement, default: 0
      t.string :lyrics
      t.integer :number
      t.integer :year
      t.references :auction, foreign_key: true
      t.references :court, foreign_key: true
      t.bigint :demandante
      t.bigint :demandado
      t.timestamps
    end
  end
end
