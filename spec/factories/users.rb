FactoryBot.define do
  factory :user do
    nickname { '山田太郎' }
    email { Faker::Internet.email }
    password { 'password1' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '2001/01/01' }
  end
end
