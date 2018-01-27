class Listing < ApplicationRecord
  validates :list_name, :user_id, :end_date, presence: true
  has_attached_file :list_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :list_image, content_type: /\Aimage\/.*\z/

  belongs_to :user

  has_many :bids,
           dependent: :destroy
end
