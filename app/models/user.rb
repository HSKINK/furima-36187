class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
            :last_name,       presence: true
            :first_name,      presence: true
            :last_name_kana,  presence: true
            :first_name_kana, presence: true
            :birthday,        presence: true
end
