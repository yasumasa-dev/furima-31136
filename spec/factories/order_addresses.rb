FactoryBot.define do
  factory :order_address do
    postal_code         {'111-1111'}
    prefecture_id       {'2'}
    city                {'土佐市'}
    address             {'街1-1-1'}
    phone_number        {'00000000000'}
    building            {'aaaa'}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
