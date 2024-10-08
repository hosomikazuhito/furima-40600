class Good < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buy
  has_one_attached :image
  
  
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery   
  belongs_to :aria   
  belongs_to :shipment

  def sold?
    buy.present?
  end

  
  def delivery_method
    case delivery_id
    when 2
      "着払い(購入者負担)"
    when 3
      "送料込み(出品者負担)"
    end
  end
  
 
 validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :name_explanation, presence: true 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :aria_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipment_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  
  def was_attached?
    self.image.attached?
  end
end
  
 


