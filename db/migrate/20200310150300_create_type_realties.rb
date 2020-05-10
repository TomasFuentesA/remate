class CreateTypeRealties < ActiveRecord::Migration[5.2]
  def change
    create_table :type_realties do |t|
      t.integer :type
      t.text :comment

      t.timestamps
    end
    add_reference :type_realties, :realty, foreign_key: true
  end
end
