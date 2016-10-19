class RemoveFortifiableFromPermissions < ActiveRecord::Migration

  def up
    remove_column :permissions, :fortifiable_id
    remove_column :permissions, :fortifiable_type
  end
  
  def down
    add_column :permissions, :fortifiable_id, :integer
    add_column :permissions, :fortifiable_type, :string
  end

end
