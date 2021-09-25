FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { "user@gmail.com" }
    password_digest { "password" }
  end
end
