class Bid < ApplicationRecord
  validates :listing_id, :user_id, :amount, presence: true

  belongs_to :listing

  belongs_to :lister,
             through: :listing,
             source: :user

  belongs_to :bidder,
             class_name: :user

  def execute_payment
    payee_wallet = lister.wallet
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
