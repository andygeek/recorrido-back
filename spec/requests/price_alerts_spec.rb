require "rails_helper"

RSpec.describe "Price_alerts", type: :request do
 
  
  describe "GET /price_alerts" do

    context "when you send without authorization in the header" do
      
      it "should return unauthorized" do
        get "/price_alerts"
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context "when you send authorization in header" do
      let!(:price_alert) { create(:price_alert) }
  
      context "when authorization token is right" do
        let!(:auth_headers) {{'Authorization' => "bearer #{JsonWebToken.encode({user_id: price_alert.user_id}, Time.now + 24.hours.to_i) }"} }
  
        it "should return ok" do
          get "/price_alerts", headers: auth_headers
          payload = JSON.parse(response.body)
          expect(payload.size).to be > 0
          expect(response).to have_http_status(:ok)
        end
      end
      context "when authorization token is incorrect" do
        let!(:auth_headers) {{'Authorization' => "bearer xxxxx"} }
        
        it "should return unauthorized" do
          get "/price_alerts", headers: auth_headers
          payload = JSON.parse(response.body)
          expect(payload["error"]).to eq("Invalid token")
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

end