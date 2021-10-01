class Item < ApplicationRecord
 
  validates :image, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :content_id, presence: true
  validates :charge_id, presence: true
  validates :area_id, presence: true
  validates :ship_id, presence: true
  validates :price, presence: true

  has_one_attached :image
  belongs_to :user
end
