class ChangeColumn < ActiveRecord::Migration[5.2]
  def change

    rename_column :judgements, :name, :type_judgement
  
    end
end
