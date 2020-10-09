class RemovePhoneAFromPhones < ActiveRecord::Migration[5.2]
  def change
    remove_column :phones, :phone_a, :string
  end
end
