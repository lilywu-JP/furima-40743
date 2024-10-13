FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '横浜' }
    addresses { '青山1-1' }
    building { '柳ビル103' }
    phone_number { '09012340122' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
