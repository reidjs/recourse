
class User < ApplicationRecord
  validates :organization_name,
            :password_digest,
            :session_token,
            :public_wallet_key,
            :private_wallet_key,
            presence: true
  validates :organization_name, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :listings,
           dependent: :destroy

  has_many :bids,
           dependent: :destroy

  has_many :bidded_items,
           through: :bids,
           source: :listings

  has_one :wallet,
          foreign_key: :public_key

  attr_reader :password
  after_initialize :ensure_default_values

  def self.find_by_credentials(organization_name, password)
    user = User.find_by(organization_name: organization_name)
    return nil unless user && user.is_password?(password)
    user
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  def ensure_default_values
    self.session_token ||= SecureRandom.urlsafe_base64
    generate_wallet
  end

  def generate_wallet
    # currently mocked
    self.public_wallet_key ||= SecureRandom.urlsafe_base64
    self.private_wallet_key ||= SecureRandom.urlsafe_base64
  end
end
