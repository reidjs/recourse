class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :organization_name, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :private_wallet_key, null: false
      t.string :public_wallet_key, null: false

      t.timestamps
    end
    add_index :users, :organization_name, unique: true
  end
end
