FactoryBot.define do
  factory :destinations_buy do
    post_code { '123-4567' }
    aria_id { 2 }
    municipalities { '横浜市' }
    street { '青葉区' }
    building { '青葉ビル' }
    telephone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end  
  