class Agregarprovincia < ActiveRecord::Migration[5.2]
  def change
    
      add_column :realties, :region_id, :integer

  end
end
