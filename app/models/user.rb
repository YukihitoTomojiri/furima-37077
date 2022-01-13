class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,           presence: true
  validates :first_name_kanji,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true }
  validates :last_name_kanji,    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true }
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :birth_date,         presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true
end
