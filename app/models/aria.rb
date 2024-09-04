class Aria < ActiveHash::Base
  self.data = [
    { id: 1, aria: '---' },
    { id: 2, aria: '北海道' },
    { id: 3, aria: '青森県' },
    { id: 4, aria: '岩手県' },
    { id: 5, aria: '宮城県' },
    { id: 6, aria: '秋田県' },
    { id: 7, aria: '山形県' },
    { id: 8, aria: '福島県' },
    { id: 9, aria: '茨城県' },
    { id: 10, aria: '栃木県' },
    { id: 11, aria: '群馬県' },
    { id: 12, aria: '埼玉県' },
    { id: 13, aria: '千葉県' },
    { id: 14, aria: '東京都' },
    { id: 15, aria: '神奈川県' },
    { id: 16, aria: '新潟県' },
    { id: 17, aria: '富山県' },
    { id: 18, aria: '石川県' },
    { id: 19, aria: '福井県' },
    { id: 20, aria: '山梨県' },
    { id: 21, aria: '長野県' },
    { id: 22, aria: '岐阜県' },
    { id: 23, aria: '静岡県' },
    { id: 24, aria: '愛知県' },
    { id: 25, aria: '三重県' },
    { id: 26, aria: '滋賀県' },
    { id: 27, aria: '京都府' },
    { id: 28, aria: '大阪府' },
    { id: 29, aria: '兵庫県' },
    { id: 30, aria: '奈良県' },
    { id: 31, aria: '和歌山県' },
    { id: 32, aria: '鳥取県' },
    { id: 33, aria: '島根県' },
    { id: 34, aria: '岡山県' },
    { id: 35, aria: '広島県' },
    { id: 36, aria: '山口県' },
    { id: 37, aria: '徳島県' },
    { id: 38, aria: '香川県' },
    { id: 39, aria: '愛媛県' },
    { id: 40, aria: '高知県' },
    { id: 41, aria: '福岡県' },
    { id: 42, aria: '佐賀県' },
    { id: 43, aria: '長崎県' },
    { id: 44, aria: '熊本県' },
    { id: 45, aria: '大分県' },
    { id: 46, aria: '宮崎県' },
    { id: 47, aria: '鹿児島県' },
    { id: 48, aria: '沖縄県' }

  
  ]

  include ActiveHash::Associations
  has_many :articles
  has_many :goods

end




