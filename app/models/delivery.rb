class Delivery < ActiveHash::Base
  self.data = [
      { id: 1, delivery: '---' },
      { id: 2, delivery: '着払い(購入者負担)' },
      { id: 3, delivery: '送料込み(出品者負担)' },
      
    ]
  
    include ActiveHash::Associations
  has_many :articles
  has_many :goods
  
    end