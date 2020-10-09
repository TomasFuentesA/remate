class CreateAuctionsRealties < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions_realties do |t|
      t.integer :auction_id 
      t.references :realty, foreign_key: true
      t.timestamps
    end
  end
end
