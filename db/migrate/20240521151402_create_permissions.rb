class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false
      t.boolean :access_granted, null: false

      t.timestamps
    end

    add_index :permissions, :user_id
    add_index :permissions, :task_id
  end
end
