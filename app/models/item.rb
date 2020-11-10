class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :shipment_date

  belongs_to :user
  has_one_attached :image
  validates :title, :explanation, :price, presence: true

  validates :category_id, :condition_id, :delivery_fee_id, :shipment_source_id, :shipment_date_id, numericality: { other_than: 1 } 
end
