FactoryBot.define do
  factory :price_alert do
    name { "MyString" }
    origin_id { 1 }
    origin_name { "MyString" }
    origin_url_name { "MyString" }
    destiny_id { 1 }
    destiny_name { "MyString" }
    destiny_url_name { "MyString" }
    class_id { 1 }
    class_name { "MyString" }
    price { "9.99" }
    user
  end
end
