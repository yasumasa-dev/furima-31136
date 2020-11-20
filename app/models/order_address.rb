class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :building
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number'}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(  postal_code: postal_code,
                   prefecture_id: prefecture_id,
                            city: city,
                         address: address,
                    phone_number: phone_number,
                        building: building,
                        order_id: order.id)
  end
end
