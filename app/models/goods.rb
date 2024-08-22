class Goods < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true 
   validates :last_name, presence: true
   validates :first_name, presence: true
   validates :kana_last_name, presence: true
   validates :kana_first_name, presence: true 
   validates :birth, presence: true
  belongs_to :user
end