class CreateAuctionsRecordsPersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions_records_personas do |t|
      t.integer :auctions_record_id
      t.integer :persona_id
      t.string :persona_type
      t.string :persona_type_description
      t.timestamps
    end
  end
end
