FactoryBot.define do
  factory :item do
    product_name      { 'test' }
    description       { 'test' }
    category_id       { 2 }
    status_id         { 2 }
    burden_id         { 2 }
    delivery_id       { 2 }
    days_delivery_id  { 2 }
    price             { 400 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
