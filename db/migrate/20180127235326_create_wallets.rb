class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.integer :private_key, null: false
      t.integer :public_key, null: false, foreign_key: true, index: true
      t.float :balance, null: false
      t.float :escrow

      t.timestamps
    end
  end
end
