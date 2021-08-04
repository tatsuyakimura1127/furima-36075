class OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :delivery_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, delivery_id: delivery_id, municipality: municipality, address: address,building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
