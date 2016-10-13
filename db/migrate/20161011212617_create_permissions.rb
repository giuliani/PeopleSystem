class CreatePermissions < ActiveRecord::Migration

  def change
    create_table :permissions do |t|
      t.string :name
      t.text   :description
      t.references :fortifiable, polymorphic: true, index: true

      t.timestamps
    end
  end

end
