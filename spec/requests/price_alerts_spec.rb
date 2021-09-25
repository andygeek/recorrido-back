require "rails_helper"

RSpec.describe "Price_alerts", type: :request do
 
  
  describe "GET /price_alerts" do

    context "when you send without authorization in the header" do
      it "should return unauthorized" do
        get "/price_alerts"
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
  
end