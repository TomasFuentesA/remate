class AddFileNameColumnToJudicialfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :judicialfiles, :file_name, :varchar
  end
end
