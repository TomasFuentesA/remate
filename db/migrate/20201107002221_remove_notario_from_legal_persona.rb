class RemoveNotarioFromLegalPersona < ActiveRecord::Migration[5.2]
  def change
    remove_column :legal_personas, :notario, :string
  end
end
