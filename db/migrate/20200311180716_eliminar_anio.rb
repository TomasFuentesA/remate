class EliminarAnio < ActiveRecord::Migration[5.2]
  def change
        remove_column :characteristics , :built_year, :date
        add_column :characteristics , :built_year, :integer
  end
end
