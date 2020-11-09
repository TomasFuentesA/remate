class AddPrecioToDomainRol < ActiveRecord::Migration[5.2]
  def change
    add_column :domain_rols, :precio, :integer
  end
end
