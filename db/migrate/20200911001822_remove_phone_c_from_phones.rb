class RemovePhoneCFromPhones < ActiveRecord::Migration[5.2]
  def change
    remove_column :phones, :phone_c, :string
  end
end
