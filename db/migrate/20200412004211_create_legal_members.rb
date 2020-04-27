class CreateLegalMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_members do |t|
      t.references :legal_persona, foreign_key: true
      t.references :legal_asociado, references: :legal_personas, foreign_key: {to_table: :legal_personas}
    

      t.timestamps
    end
  end
end
