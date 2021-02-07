FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postcode { '111-1111' }
    prefecture_id { 2 }
    city { '古賀市' }
    block { '千鳥' }
    building { 'ハイツ１−１−１' }
    phone_number { '00000000000' }
  end
end
