class CreatePeopleRoles < ActiveRecord::Migration
  def change

    create_table :people_roles do |t|
      t.integer :person_id
      t.integer :role_id

      t.timestamps
    end
  end
end
