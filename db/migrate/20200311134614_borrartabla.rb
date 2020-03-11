class Borrartabla < ActiveRecord::Migration[5.2]
  def change
    drop_table :legal_people
    drop_table :natural_people
  end
end
