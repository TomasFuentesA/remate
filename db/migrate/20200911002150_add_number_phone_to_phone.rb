class AddNumberPhoneToPhone < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :number_phone, :string
  end
end
