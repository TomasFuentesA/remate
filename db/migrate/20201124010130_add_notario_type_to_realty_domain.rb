class AddNotarioTypeToRealtyDomain < ActiveRecord::Migration[5.2]
  def change
    add_column :realty_domains, :notario_type, :string
  end
end
