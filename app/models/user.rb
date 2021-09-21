class User < ApplicationRecord
  has_many :price_alerts

  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
