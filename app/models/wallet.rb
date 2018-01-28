class Wallet < ApplicationRecord
  validates :private_key, :public_key, :balance, presence: true
  validates :balance, minimum: 0

  belongs_to :user,
             foreign_key: :public_key

  def hold_in_escrow(escrow_amount)
    self.escrow += escrow_amount
    self.balance -= escrow_amount
    self.save!
  end

  def release_from_escrow(escrow_amount)
    self.escrow -= escrow_amount
    self.balance += escrow_amount
    self.save!
  end

  def pay(payee_wallet, transaction_amount)
    payee_wallet.balance += transaction_amount
    self.balance -= transaction_amount
    ActiveRecord::Base.transaction do
      payee_wallet.save!
      self.save!
    end
  end
end
