class AddFileNameColumnToAppraisals < ActiveRecord::Migration[5.2]
  def change
    add_column :appraisals, :file_name, :varchar
  end
end
