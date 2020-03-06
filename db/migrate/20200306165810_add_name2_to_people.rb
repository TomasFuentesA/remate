class AddName2ToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :name2, :string
  end
end
