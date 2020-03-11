class DeleteForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :realties,:communes
    
  end
end
