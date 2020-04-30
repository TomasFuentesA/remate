class AddAddressToCondominio < ActiveRecord::Migration[5.2]
  def change
    add_column :condominios, :address, :string
  end
end
