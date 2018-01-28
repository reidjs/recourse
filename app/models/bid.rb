class Bid < ApplicationRecord
  validates :listing_id, :user_id, :amount, presence: true

  belongs_to :listing

  has_one :lister,
          through: :listing,
          source: :user

  belongs_to :bidder,
             class_name: :user

  def execute_payment
    payor_wallet = bidder.wallet
    payee_wallet = lister.wallet
    payor_wallet.pay(payee_wallet)
    return amount
  rescue RuntimeError
  end
end
