FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abc0000' }
    password_confirmation { password }
    last_name_kanji       { '山田' }
    first_name_kanji      { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1990/8/30' }
  end
end
