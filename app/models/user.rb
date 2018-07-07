class User < ApplicationRecord
  NAME_REGEX = /\A[\w\s]+\z/i
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,  presence: true,
                    format: {with: NAME_REGEX},
                    length: {maximum: 50}
  validates :email, presence: true,
                    format: {with: EMAIL_REGEX},
                    uniqueness: true,
                    length: {maximum: 255}
  validates :password, presence: true,
                      length: {minimum: 6},
                      allow_nil: true
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
end
