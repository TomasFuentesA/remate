class AddReferencePartToAuction < ActiveRecord::Migration[5.2]
  def change
    add_reference :parts, :auction, foreign_key: true
  end
end
