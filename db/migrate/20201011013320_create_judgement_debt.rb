class CreateJudgementDebt < ActiveRecord::Migration[5.2]
  def change
    create_table :judgement_debts do |t|
      t.integer :person_id
      t.string :person_type
      t.integer :money_total
      t.integer :money_type
      t.date :debt_date
      t.integer :debt_type
    end
  end
end
