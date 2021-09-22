class MinPrice < ApplicationRecord
  belongs_to :price_alert

  validates :date_fetch, presence: true
  validates :hour, presence: true
  validates :class_id, presence: true
  validates :buss_operator_name, presence: true
  validates :price_alert_id, presence: true
end
