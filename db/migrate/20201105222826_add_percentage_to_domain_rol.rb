class AddPercentageToDomainRol < ActiveRecord::Migration[5.2]
  def change
    add_column :domain_rols, :percentage, :integer
  end
end
