class Item < ApplicationRecord
  validates :image,       presence: true
  validates :product,     presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :content_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :price,       inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  has_one :history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :content
  belongs_to :charge
  belongs_to :area
  belongs_to :ship
end
