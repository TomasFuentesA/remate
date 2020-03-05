class AgregarTipoJuicio < ActiveRecord::Migration[5.2]
  def change
    add_column  :auctions , :type_judgment, :integer
  end
end
