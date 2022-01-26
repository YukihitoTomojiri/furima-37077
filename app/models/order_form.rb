class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :block, :building, :phone_number
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :area_id
    validates :municipality
    validates :block
    validates :phone_number
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, block: block, building: building, phone_number: phone_number, order_id: order_id)
  end
end