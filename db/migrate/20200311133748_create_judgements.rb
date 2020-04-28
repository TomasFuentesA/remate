class CreateJudgements < ActiveRecord::Migration[5.2]
  def change
    create_table :judgements do |t|

      t.integer :type_judgement, default: 0
      t.references :auction, foreign_key: true


      t.timestamps
    end
  end
end
