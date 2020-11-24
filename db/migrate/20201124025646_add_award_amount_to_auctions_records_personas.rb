class AddAwardAmountToAuctionsRecordsPersonas < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions_records_personas, :award_amount, :float
  end
end
