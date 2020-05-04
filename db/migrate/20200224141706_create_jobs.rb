class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :rut
      t.string :position
      t.integer :salary
      t.string :business
      t.text :description
      t.references :persona , foreign_key: true


      t.timestamps
    end

  end
  
end
