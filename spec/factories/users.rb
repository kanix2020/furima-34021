FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email { Faker::Internet.free_email }
    password { '00000a' }
    password_confirmation { password }
    last_name { '阿部' }
    first_name { '寛' }
    last_name_kana { 'アベ' }
    first_name_kana { 'ヒロシ' }
    birthday { 0o000 - 0o0 - 0o0 }
  end
end
