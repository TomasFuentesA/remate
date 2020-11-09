class AddAccionesVentaToDomainRol < ActiveRecord::Migration[5.2]
  def change
    add_column :domain_rols, :acciones_venta, :integer
  end
end
