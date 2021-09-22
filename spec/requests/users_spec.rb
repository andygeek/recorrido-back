require "rails_helper"

RSpec.describe "Users", type: :request do

  describe "POST /users/signup" do
    context "when sending parameters" do
      let!(:create_params) { { "user" => { 
        "name" => Faker::Name.first_name,
        "username" => Faker::Name.first_name,
        "password" => Faker::Name.first_name } } }

      it "should create a user" do
        post "/users/signup", params: create_params
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:ok)
      end    
    end
  end
  
  describe "POST /users/login" do
    context "when sending parameters" do
      let!(:user) { create(:user) }
      let!(:login_params) { { "user" => { 
        "username" => user.username,
        "password" => user.password } } }
        
      it "should return user info" do
        post "/users/login", params: login_params
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:ok)
      end
    end
  end
end