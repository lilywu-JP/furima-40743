FactoryBot.define do
  factory :item do
    item_name { 'Test Item' }
    item_info { 'This is a test item.' }
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/testimage/test_image.png')), 'image/png') }
    category_id { 3 }
    sales_status_id { 3 }
    shipping_fee_status_id { 3 }
    prefecture_id { 3 }
    scheduled_delivery_id { 3 }
    item_price { 600 }
    association :user
    association :category
    association :sales_status
    association :shipping_fee_status
    association :prefecture
    association :scheduled_delivery
  end
end
