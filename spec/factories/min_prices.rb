FactoryBot.define do
  factory :min_price do
    date_fetch { "2021-09-22" }
    hour { "2021-09-22 15:48:24" }
    class_id { "" }
    min_price { "9.99" }
    buss_operator_name { "MyString" }
    price_alert { nil }
  end
end
