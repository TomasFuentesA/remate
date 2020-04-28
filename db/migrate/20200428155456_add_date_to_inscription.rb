class AddDateToInscription < ActiveRecord::Migration[5.2]
  def change
    add_column :inscriptions, :date, :date
  end
end
