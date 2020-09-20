class AddForeignKeyToDomainfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :domainfiles, :domain, foreign_key: true
  end
end
