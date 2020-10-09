class AddTypePhoneToPhone < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :type_phone, :string
  end
end
