FactoryBot.define do
  factory :order_address do
    postal_code       { '123-4567' }
    prefecture_id     { '5' }
    municipality      { '横浜市緑区' }
    house_number      { '青山１ー1-1' }
    building_name     { '柳ビル２110' }
    telephone_number  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
