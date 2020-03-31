class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :rut
      t.string :position
      t.integer :salary
      t.string :business
      t.text :description
      t.belongs_to :jobable, polymorphic: true

      t.timestamps
    end
     add_index :jobs, [:jobable_id, :jobable_type]
  end
end
