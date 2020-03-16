class RenameColumn < ActiveRecord::Migration[5.2]
  def change

    change_column :judgements, :type_judgement, 'integer USING CAST(type_judgement AS integer)'
  end
end
