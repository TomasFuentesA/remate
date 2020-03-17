class CreateJudgements < ActiveRecord::Migration[5.2]
  def change
    create_table :judgements do |t|

      t.integer :type_judgement


      t.timestamps
    end
  end
end
