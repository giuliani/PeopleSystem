class ChangeBirthdateToNotNull < ActiveRecord::Migration
  def up
    change_column :people, :birthdate, :date, :null => false
  end

  def down
    change_column :people, :birthdate, :date, :null => true
  end
end
