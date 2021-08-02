class OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :municipality
  validates :address
  validates :phone_number
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality:{other_than: 0, message: "can't be blank"}
  validates :token
  #validates :price
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end

  
  



