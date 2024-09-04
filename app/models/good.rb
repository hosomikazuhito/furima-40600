class Good < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
  

 
 
  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :name_explanation, presence: true 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :aria_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipment_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  
end
