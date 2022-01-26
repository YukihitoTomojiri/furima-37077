class Address < ApplicationRecord
  belongs_to             :order
  belongs_to_active_hash :area

  validates :postal_code, presence: true
  validates :area_id,     presence: true
  validates :municipality, presence: true
  validates :block,        presence: true
  validates :phone_number, presence: true
  
end
