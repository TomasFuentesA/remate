class CreateDomainfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :domainfiles do |t|
      t.string :file_name
      t.string :obs_string
      t.date :date
    end
  end
end
