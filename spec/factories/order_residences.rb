FactoryBot.define do
  factory :order_residence do
    user_id { '1' }
    item_id { '1' }
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '111-1111' }
    prefecture { 1 }
    municipality { '墨田区' }
    address { '1-1-1' }
    phone_number { '11122223333' }
  end
end
