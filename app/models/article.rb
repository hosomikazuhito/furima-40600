class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buy


  validates :name, presence: true
  validates :name_explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0 }
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }
  validates :delivery_id,  presence: true, numericality: { other_than: 0 }
  validates :aria_id,  presence: true, numericality: { other_than: 0 }
  validates :shipment_id,  presence: true, numericality: { other_than: 0 }
  validates :price, presence: true
   
  #validates :title, :text, presence: true
  #validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}


end
