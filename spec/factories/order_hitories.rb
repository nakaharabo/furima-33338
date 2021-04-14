FactoryBot.define do
  factory :order_history do
    post_number {"222-3333"}
      shipment_area_id { 2 }
      city { "東京都" }
      address { "青山1-1-1" }
      building_name { "八反田ビル" }
      phone_number { "08026954019" }
      token {"tok_abcdefghijk00000000000000000"}

  end
end
