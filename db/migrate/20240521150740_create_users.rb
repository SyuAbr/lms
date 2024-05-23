class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :surname, null: false
      t.string :name, null: false
      t.string :middle_name

      t.timestamps
    end
  end
end
