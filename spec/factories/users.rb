FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name             {Faker::Name.initials(number: 2)}
    first_name            {Faker::Name.initials(number: 2)}
    last_name_kana        {"スズキ"}
    first_name_kana       {"シンヤ"}
    birth                 {Faker::Date.backward}
  end 
end