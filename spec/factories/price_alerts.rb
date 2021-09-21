FactoryBot.define do
  factory :price_alert do
    name { "MyString" }
    origin_id { 1 }
    destiny_id { 1 }
    class_id { 1 }
    price { "9.99" }
    user
  end
end
