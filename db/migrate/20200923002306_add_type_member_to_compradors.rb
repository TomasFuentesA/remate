class AddTypeMemberToCompradors < ActiveRecord::Migration[5.2]
  def change
    add_column :compradors, :type_member, :string
  end
end
