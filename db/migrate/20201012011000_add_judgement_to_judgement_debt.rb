class AddJudgementToJudgementDebt < ActiveRecord::Migration[5.2]
  def change
    add_reference :judgement_debts, :judgement, foreign_key: true
  end
end
