class AddCondominiosToRealties < ActiveRecord::Migration[5.2]
  def change
    add_reference :realties, :condominio, foreign_key: true
  end
end
