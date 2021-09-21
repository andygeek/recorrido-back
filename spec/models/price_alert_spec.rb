require 'rails_helper'

RSpec.describe PriceAlert, type: :model do
  
  describe "validations" do
    it "validate precense of requirements" do
      should validate_presence_of(:name)
      should validate_presence_of(:origin_id)
      should validate_presence_of(:destiny_id)
      should validate_presence_of(:class_id)
      should validate_presence_of(:price)
      should validate_presence_of(:user_id)
    end
  end
end
