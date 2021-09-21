require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it "validate precense of requirements" do
      should validate_presence_of(:name)
      should validate_presence_of(:username)
      should validate_presence_of(:password)
    end
  end
end
