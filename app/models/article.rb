class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :shipment_area
  belongs_to :shipment_day

  validates :title, :text, presence: true
  validates :state_id, numericality: { other_than: 1 } 
end
