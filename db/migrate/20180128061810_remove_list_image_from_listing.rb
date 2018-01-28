class RemoveListImageFromListing < ActiveRecord::Migration[5.1]
  def up
    remove_attachment :listings, :list_image
  end

  def down
    add_attachment :listings, :list_image
  end
end
