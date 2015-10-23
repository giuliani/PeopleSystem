class ChangePeople < ActiveRecord::Migration
  def up
    change_column :people, :email, :string, :limit => 254, :null => false
    change_column :people, :gender, :string, :limit => 1
    change_column :people, :first_name, :string, :limit => 75, :null => false
    change_column :people, :last_name, :string, :limit => 75, :null => false
    add_index     :people, :email, :unique => true
  end
  
  def down
    change_column :people, :email, :string, :limit => 255, :null => true
    change_column :people, :gender, :string, :limit => 255
    change_column :people, :first_name, :string, :limit => 255, :null => true
    change_column :people, :last_name, :string, :limit => 255, :null => true
    remove_index  :people, :column => :email
  end
end
