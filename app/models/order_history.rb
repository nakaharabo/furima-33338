class OrderHistory
  include ActiveModel::Model
  attr_accessor :post_number, :shipment_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipment_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end


  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Order.create(post_number: post_number, shipment_area_id: shipment_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, history_id: history.item_id)  
  end
end