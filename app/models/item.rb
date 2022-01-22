class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :PostageType
  belongs_to_active_hash :item_area
  belongs_to_active_hash :item_preparation_day
  has_one_attached       :image
  belongs_to             :user

  with_options presence: true do
    validates :image
    validates :item
    validates :comment
    validates :category_id,        numericality: { other_than: 1, message: "can't be Blank" }
    validates :postage_type_id,    numericality: { other_than: 1, message: "can't be Blank" }
    validates :status_id,          numericality: { other_than: 1, message: "can't be Blank" }
    validates :area_id,            numericality: { other_than: 1, message: "can't be Blank" }
    validates :preparation_day_id, numericality: { other_than: 1, message: "can't be Blank" }
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
  end
end
