class CreateAuctionrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :auctionrecords do |t|
      t.date :date
      t.integer :awardamount
      t.references :judgement, foreign_key: true

      t.timestamps
    end
  end
end
