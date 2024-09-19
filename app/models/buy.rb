class Buy < ApplicationRecord
  has_one :destination
  belongs_to :good
  belongs_to :user

end

