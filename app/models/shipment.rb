class Shipment < ActiveHash::Base
  self.data = [
    { id: 1, shipment: '---' },
    { id: 2, shipment: '1~2日で発送' },
    { id: 3, shipment: '2~3日で発送' },
    { id: 4, shipment: '4~7日で発送' },
  ] 
  

  include ActiveHash::Associations
  has_many :articles
  has_many :goods

end