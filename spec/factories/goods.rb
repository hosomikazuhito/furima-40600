FactoryBot.define do
  factory :good do
    name { "My Good Name" }
    name_explanation { "My Good Explanation" }
    category_id { 2 }
    condition_id { 2 }
    delivery_id { 2 }
    aria_id { 2 }
    shipment_id { 2 }
    price { 1000 }
    association :user

    # after(:build)ブロック内でimageをアタッチします
    after(:build) do |good|
      good.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'default_image.png')), filename: 'default_image.png', content_type: 'image/png')
    end
  end
end