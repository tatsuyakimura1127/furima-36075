FactoryBot.define do
  factory :order_residence do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    delivery_id { 1 }
    municipality { '墨田区' }
    address { '1-1-1' }
    building_name { 'park axis' }
    phone_number { '11122223333' }
  end
end
