class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :block, :building, :phone_number, :order
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipality
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is too short."}, numericality: {only_integer: true, message: "is invalid. Input only number"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end