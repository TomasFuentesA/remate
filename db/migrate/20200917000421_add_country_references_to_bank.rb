class AddCountryReferencesToBank < ActiveRecord::Migration[5.2]
  def change
    add_reference :banks, :country, foreign_key: true
  end
end
