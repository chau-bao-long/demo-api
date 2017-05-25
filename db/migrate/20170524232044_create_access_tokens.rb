class CreateAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :access_tokens do |t|
      t.string :access_token
      t.references :user, foreign_key: true
      t.string :refresh_token
      t.integer :expires_in

      t.timestamps
    end
    add_index :access_tokens, :access_token, unique: true
    add_index :access_tokens, :refresh_token, unique: true
  end
end
