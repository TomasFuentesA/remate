class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :part1
      t.string :part2
      t.timestamps
    end
  end
end
