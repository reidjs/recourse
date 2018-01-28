class AddAmountToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :amount, :float, null: false
  end
end
