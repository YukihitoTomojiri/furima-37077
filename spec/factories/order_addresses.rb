FactoryBot.define do
  factory :order_address do
    token        { 'tok_abcdefghijk00000000000000000' }
    postal_code  { '123-4567' }
    area_id      { 30 }
    municipality { '熊本市' }
    block        { '123' }
    building     { 'アパート' }
    phone_number { '08008080808' }
  end
end
