class RelationInscriptionDomain < ActiveRecord::Migration[5.2]
  def change
    remove_column :domains, :name_realty, :string
    remove_column :domains, :rut_owner, :string
    add_column :domains, :percentage, :float
    add_reference :inscriptions,:domain, foreign_key: true
  end
end
