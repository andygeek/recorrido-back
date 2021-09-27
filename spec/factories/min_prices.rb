FactoryBot.define do
  factory :min_price do
    search_result_id { 1 }
    date_departure { "2021-09-24" }
    hour { "2021-09-24 19:48:52" }
    class_id { 1 }
    min_price { "9.99" }
    buss_operator_name { "MyString" }
    price_alert
  end
end
