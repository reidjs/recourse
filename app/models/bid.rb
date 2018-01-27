class Bid < ApplicationRecord
  validates :listing_id, :user_id, presence: true

  belongs_to :listing
  belongs_to :user
end
