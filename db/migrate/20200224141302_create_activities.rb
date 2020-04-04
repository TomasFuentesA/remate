class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :rut
      t.string :code
      t.string :name_activity
      t.string :afect_iva
      t.integer :category
      t.belongs_to :activityable, polymorphic: true


      t.timestamps
    end
     add_index :activities, [:activityable_id, :activityable_type]
  end
end
