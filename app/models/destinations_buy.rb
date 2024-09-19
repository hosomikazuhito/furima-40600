class DestinationsBuy
  include ActiveModel::Model
  attr_accessor :post_code, :aria_id, :municipalities, :street, :building, :telephone, :price, :user_id, :token, :good_id  

  with_options presence: true do
  validates :token, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :aria_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipalities, presence: true
  validates :street, presence: true
  validates :telephone, presence: true, length: { in: 10..11, message: "is too short" }, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
  validates :user_id
  validates :good_id
  end

  def save
    return false unless valid?

    buy = Buy.create(good_id: good_id, user_id: user_id)
    Destination.create(post_code: post_code, aria_id: aria_id, municipalities: municipalities, street: street, building: building, telephone: telephone, buy_id: buy.id)
  end
end