class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :shipment_date

  belongs_to :user
  has_one_attached :image

  validates :title, :explanation, :image, presence: true

  validates :category_id, :condition_id, :delivery_fee_id, :shipment_source_id, :shipment_date_id, numericality: { other_than: 1, message: 'Select' } 

  with_options numericality: true, format: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
    validates :price
  end

  validates :price, numericality: {
             greater_than_or_equal_to: 300,
             less_than_or_equal_to: 9999999,
             message: 'Out of setting range' 
  }
end