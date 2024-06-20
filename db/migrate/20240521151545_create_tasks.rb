  class CreateTasks < ActiveRecord::Migration[7.1]
    def change
      create_table :tasks do |t|
        t.index :id
        t.text :title, null: false
        t.text :task_type, null: false
        t.integer :parent_id

        t.timestamps
      end
    end
  end













