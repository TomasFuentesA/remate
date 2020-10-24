class CreateFileUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploads do |t|
      t.string :file_name
      t.string :model
      t.integer :model_id

      t.timestamps
    end
  end
end
