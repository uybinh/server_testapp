class User < ApplicationRecord
  NAME_REGEX = /\A[\w\s]+\z/i
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,  presence: true,
                    format: {with: NAME_REGEX},
                    length: {maximum: 50}
  validates :email, presence: true,
                    format: {with: EMAIL_REGEX},
                    length: {maximum: 255}
  validates :password, presence: true,
                      length: {minimum: 6},
                      allow_nil: true
  has_secure_password
end
