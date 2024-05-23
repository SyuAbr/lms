class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false
      t.integer :grade, null: false
      t.datetime :date_complite, null: false

      t.timestamps
    end

    add_index :results, :user_id
    add_index :results, :task_id
  end
end
