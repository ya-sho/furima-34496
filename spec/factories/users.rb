FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"鈴木"}
    first_name            {"真也"}
    last_name_kana        {"スズキ"}
    first_name_kana       {"シンヤ"}
    birth                 {Faker::Date.backward} 
  end 
end