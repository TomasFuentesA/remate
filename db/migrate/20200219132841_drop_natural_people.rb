class DropNaturalPeople < ActiveRecord::Migration[5.2]
  def change
    drop_table :natural_people
  end
end
