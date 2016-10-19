class AddRolesAndBastions < ActiveRecord::Migration

  def up
    execute "insert into roles (name, description, created_at, updated_at) values ('admin', 'System Administrator', NOW(), NOW())"
    execute "insert into roles (name, description, created_at, updated_at) values ('assistant', 'System Administrator Assistant', NOW(), NOW())"
    execute "insert into roles (name, description, created_at, updated_at) values ('basic', 'Simple User with bare minimum permissions', NOW(), NOW())"
    
    execute "insert into people_roles (person_id, role_id) values (#{Person.first.id}, 1)"
    execute "insert into people_roles (person_id, role_id) values (#{Person.last.id}, 2)"
    
    execute "insert into bastions (fortifiable_id, fortifiable_type, permission_id) values (2, 'Role', 1)"
    execute "insert into bastions (fortifiable_id, fortifiable_type, permission_id) values (2, 'Role', 2)"

  end
  
  def down
    Role.delete_all
    PeopleRole.delete_all
    Bastion.delete_all
  end

end

