class AddDomainRolToComprador < ActiveRecord::Migration[5.2]
  def change
    add_reference :compradors, :domain_rol, foreign_key: true
  end
end
