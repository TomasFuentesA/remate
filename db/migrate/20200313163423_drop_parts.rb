class DropParts < ActiveRecord::Migration[5.2]
  def change
    drop_table :parts  do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "auction_id"
      t.index ["auction_id"], name: "index_parts_on_auction_id"

  end
  end
end
