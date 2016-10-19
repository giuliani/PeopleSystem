class AddPermissions < ActiveRecord::Migration

  def up
    execute "insert into permissions (name, description) values ('view_people', 'permission to view any user profile')"

  execute "insert into permissions (name, description) values ('create_people', 'permission to create new users')"

  execute "insert into permissions (name, description) values ('destroy_people', 'permission to delete any user in the system')"
  end
  
  def down
    Permission.delete_all
  end

end

