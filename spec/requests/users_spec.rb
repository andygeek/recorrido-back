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

      context "when authorization token is right" do
        let!(:auth_headers) {{'Authorization' => "bearer #{JsonWebToken.encode({user_id: user.id}, Time.now + 24.hours.to_i) }"} }

        it "should return ok" do
          get "/users", headers: auth_headers
          payload = JSON.parse(response.body)
          expect(payload.size).to be > 0
          expect(response).to have_http_status(:ok)
        end
      end
      context "when authorization token is incorrect" do
        let!(:auth_headers) {{'Authorization' => "bearer xxxxx"} }
        
        it "should return unauthorized" do
          get "/users", headers: auth_headers
          payload = JSON.parse(response.body)
          expect(payload["error"]).to eq("Invalid token")
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

  describe "POST /users/signup" do
    context "when you no send params" do

      it "should return params missin error" do
        post "/users/signup"
        payload = JSON.parse(response.body)
        expect(payload["error"]).to eq("No parameters found")
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "when user exist in db" do
      let!(:user) { create(:user) }
      let!(:create_params) { { "user" => { "name" => Faker::Name.first_name, "email" => user.email, "password" => "abc123abc123" } } }

      it "should return 'User already exists'" do
        post "/users/signup", params: create_params
        payload = JSON.parse(response.body)
        expect(payload["error"]).to eq("User already exists")
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end