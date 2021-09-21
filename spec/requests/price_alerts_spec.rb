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


  describe "GET /price_alerts/find_by_userid/{id}" do
    
    context "when there is no alert created" do
      it "should return nothing" do
        get "/price_alerts/find_by_userid/#{rand(1..10)}"
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:ok) 
      end
    end
    context "when there are alerts created" do
      let!(:first_price_alert) { create(:price_alert) }
      context "but the user we are looking does not have alerts" do
        it "should return nothing" do
          get "/price_alerts/find_by_userid/#{first_price_alert.user_id + 1}" 
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(0)
          expect(response).to have_http_status(:ok) 
        end
      end
      context "but the user we are looking does have alerts" do
        it "should return an array of size greater than 0" do
          get "/price_alerts/find_by_userid/#{first_price_alert.user_id}" 
          payload = JSON.parse(response.body)
          expect(payload.size).to be > 0
          expect(response).to have_http_status(:ok) 
        end
      end
    end
  end
  
end