class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.string :email, limit: 50
      t.string :password_digest
      t.boolean :is_company

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
