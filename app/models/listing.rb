class Listing < ApplicationRecord
  validates :list_name, :user_id, :end_date, presence: true
  has_attached_file :list_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :list_image, content_type: /\Aimage\/.*\z/

  belongs_to :user

  has_many :bids,
           dependent: :destroy

  has_many :bidders,
           through: :bids,
           source: :bidders

  def clear_auction
    bids = Bid
      .find_by(listing_id: self.listing_id)
      .sort_by(:amount) { |x, y| y <=> x }
      bids.each do |b| # likely to go through, so don't use include
        begin
          payor_wallet = b.bidder.wallet
          payor_wallet.pay(payee_wallet)
          return amount
        rescue RuntimeError # just move on to the next highest bidder
        end
      end
      raise RuntimeError('Auction failed: no bids cleared.')
  end
end
