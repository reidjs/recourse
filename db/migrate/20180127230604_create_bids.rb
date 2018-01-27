class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.integer :listing_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
