class AddColumnToDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :domains, :valor, :integer
  end
end
