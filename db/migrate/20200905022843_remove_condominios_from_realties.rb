class RemoveCondominiosFromRealties < ActiveRecord::Migration[5.2]
  def change
    remove_reference :realties, :condominio, foreign_key: true
  end
end
