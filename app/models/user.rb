class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input full-width characters' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

  has_many :items
  has_many :histories
end
