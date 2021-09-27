require 'rails_helper'

RSpec.describe MinPrice, type: :model do

  describe "validations" do
    it "validate precense of requirements" do
      should validate_presence_of(:search_result_id)
      should validate_presence_of(:date_departure)
      should validate_presence_of(:hour)
      should validate_presence_of(:class_id)
      should validate_presence_of(:class_name)
      should validate_presence_of(:buss_operator_name)
      should validate_presence_of(:price_alert_id)
    end
  end
end
