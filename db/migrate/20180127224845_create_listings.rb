class CreateListings < ActiveRecord::Migration[5.1]
  def up
    create_table :listings do |t|
      t.string :list_name, null: false
      t.string :user_id, null: false
      t.text :description
      t.datetime :end_date, null: false
      t.float :min_bid

      t.timestamps
    end
    add_attachment :listings, :list_image
  end

  def down
    create_table :listings do |t|
      t.string :list_name, null: false
      t.string :user_id, null: false
      t.text :description
      t.datetime :end_date, null: false
      t.float :min_bid

      t.timestamps
    end
    remove_attachment :listings, :list_image
  end
end
