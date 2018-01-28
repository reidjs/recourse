class Wallet < ApplicationRecord
  validates :private_key, :public_key, :balance, presence: true
  validates :balance, minimum: 0

  belongs_to :user,
             foreign_key: :public_key
end
