class PriceAlert < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :origin_id, presence: true
  validates :destiny_id, presence: true
  validates :class_id, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end