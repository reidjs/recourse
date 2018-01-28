class AddListUrlToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :list_url, :string
  end
end
