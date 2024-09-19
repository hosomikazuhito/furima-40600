class Destination < ApplicationRecord
  belongs_to :buy

  validates :post_code, presence: true
  validates :aria_id, presence: true
  validates :municipalities, presence: true
  validates :street, presence: true
  validates :telephone, presence: true

end

