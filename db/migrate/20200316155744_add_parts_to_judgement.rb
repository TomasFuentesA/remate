class AddPartsToJudgement < ActiveRecord::Migration[5.2]
  def change
    add_reference :parts, :judgement, foreign_key: true, index: true
  end
end
