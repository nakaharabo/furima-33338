class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :shipment_area
  belongs_to :shipment_day

  
 
  with_options presence: true do
    validates :name
    validates :image
    validates :description
  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :shipment_area_id
    validates :shipment_day_id
     end
        with_options inclusion: { in: (300..9999999)} do
          with_options format: { with: /\A[0-9]+\z/} do
            validates :price
          end
        end

   end
end
