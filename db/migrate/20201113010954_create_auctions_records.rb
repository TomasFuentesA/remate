class CreateAuctionsRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions_records do |t|

      t.integer :award_person_id
      t.integer :auction_id
      t.date :date
      t.string :file_name
      t.float :award_amount
      t.integer :status
      t.timestamps
    end
  end
end
