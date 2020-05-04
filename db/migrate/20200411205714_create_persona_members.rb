class CreatePersonaMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :persona_members do |t|
      t.references :persona,null: false, foreign_key: true
      t.references :legal_persona,null: false, foreign_key: true
      t.float :percentage
      t.timestamps
    end
  end
end
