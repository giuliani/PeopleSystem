class CreateBastions < ActiveRecord::Migration
  def change

    create_table :bastions do |t|
      t.references :fortifiable, polymorphic: true
      t.integer :permission_id

      t.timestamps
    end
  end
end
