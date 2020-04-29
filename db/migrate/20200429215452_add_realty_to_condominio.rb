class AddRealtyToCondominio < ActiveRecord::Migration[5.2]
  def change
    add_reference :condominios, :realty, foreign_key: true, index: true
  end
end
