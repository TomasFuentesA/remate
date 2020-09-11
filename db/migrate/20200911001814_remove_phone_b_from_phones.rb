class RemovePhoneBFromPhones < ActiveRecord::Migration[5.2]
  def change
    remove_column :phones, :phone_b, :string
  end
end
