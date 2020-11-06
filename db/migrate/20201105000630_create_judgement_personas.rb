class CreateJudgementPersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :judgement_personas do |t|
      t.integer :judgement_id
      t.integer :persona_id
      t.string :persona_type
      t.string :judgement_type
      t.timestamps
    end
  end
end
