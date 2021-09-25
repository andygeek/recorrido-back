class User < ApplicationRecord
  has_secure_password
  has_many :price_alerts

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
end
