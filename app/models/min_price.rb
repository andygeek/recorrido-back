class MinPrice < ApplicationRecord
  belongs_to :price_alert

  validates :search_result_id, presence: true
  validates :date_fetch, presence: true
  validates :hour, presence: true
  validates :class_id, presence: true
  validates :min_price, presence: true
  validates :buss_operator_name, presence: true
  validates :price_alert_id, presence: true
end