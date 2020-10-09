class AddNotarioColumnToDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :domains, :notario_id, :integer
  end
end
