FactoryBot.define do
  factory :item do
      name { 'テスト' }
      description { 'test' }
      category_id { 2 }
      state_id { 2 }
      delivery_fee_id { 2 }
      shipment_area_id { 2 }
      shipment_day_id { 2 }
      price { 3000 }
    
      association :user
      
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
