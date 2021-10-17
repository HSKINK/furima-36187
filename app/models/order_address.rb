class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :number, :history_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :number, format: {with: /\A[0-9]\z/, message: "is invalid."}
    validates :history_id
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :building_name

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, number: number, history_id: history.id)
  end
end