class DropParts < ActiveRecord::Migration[5.2]
  def change
    drop_table :parts
    add_column :judgements, :part1, :string
    add_column :judgements, :part2, :string
  end
end
