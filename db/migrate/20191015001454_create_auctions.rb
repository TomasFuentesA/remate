class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.date :date
      t.time :hour
      t.integer :cost
      t.integer :minimun
      t.float :uf
      t.integer :pesos
      t.float :total_minimum
      t.float :warranty
      t.float :fee
      t.string :name
      t.references :auctionnotice, foreign_key: true
      t.references :realty, foreign_key: true
      

      t.timestamps
    end
  end
end
