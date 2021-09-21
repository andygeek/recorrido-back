require "rails_helper"

RSpec.describe "Price_alerts", type: :request do

  describe "GET /price_alerts" do

    context "when no price_alerts" do
      it "should return nothing" do
        get "/price_alerts"
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:ok)  
      end
    end
  end
  
end