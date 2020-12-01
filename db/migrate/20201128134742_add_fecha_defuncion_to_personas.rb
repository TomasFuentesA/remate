class AddFechaDefuncionToPersonas < ActiveRecord::Migration[5.2]
  def change
    add_column :personas, :fecha_defuncion, :date
  end
end
