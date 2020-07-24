class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :address
      t.string :email
      t.boolean :agree_with_terms_and_policies, default: false, null: false
      t.string :role

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
