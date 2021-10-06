class Item < ApplicationRecord
 
  validates :image,       presence: true
  validates :product,     presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :content_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,       numericality: {in: 300..9_999_999}, format: {with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :content, :charge, :area, :ship

end
