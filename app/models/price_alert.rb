class PriceAlert < ApplicationRecord
  belongs_to :user
  has_many :min_prices
  
  validates :name, presence: true
  validates :origin_id, presence: true
  validates :origin_name, presence: true
  validates :origin_url_name, presence: true
  validates :destiny_id, presence: true
  validates :destiny_name, presence: true
  validates :destiny_url_name, presence: true
  validates :class_id, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end