FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { "user@gmail.com" }
    password { "user@gmail.com" }
  end
end
