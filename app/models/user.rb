class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goods
  has_many :buys

   validates :nickname, presence: true 
   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'


   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
   validates :last_name, presence: true
   validates :first_name, presence: true
end

with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
   validates :kana_last_name, presence: true
   validates :kana_first_name, presence: true 
end

   validates :birth, presence: true



end
