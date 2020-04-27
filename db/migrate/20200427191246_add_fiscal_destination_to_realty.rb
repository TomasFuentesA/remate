class AddFiscalDestinationToRealty < ActiveRecord::Migration[5.2]
  def change
    add_column :realties, :fiscal_destination, :string
  end
end
