class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :building
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id) # token入れる？
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
