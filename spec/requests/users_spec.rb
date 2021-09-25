require "rails_helper"

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    context "when you send without authorization in the header" do

      it "should return unauthorized" do
        get "/users"
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context "when you send authorization in header" do
      
      let!(:user) { create(:user) }
      let!(:auth_headers) {{'Authorization' => "bearer #{JsonWebToken.encode({user_id: user.id}, Time.now + 24.hours.to_i) }"} }

      it "should return ok" do
        get "/users", headers: auth_headers
        expect(response).to have_http_status(:ok)
      end
    end
  end
end