FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name  {"中原"}
    first_name {"翔大"}
    last_name_kana {"ナカハラ"}
    first_name_kana {"ショウタ"}
    birth_day {"1991-05-14"}
    end
end
