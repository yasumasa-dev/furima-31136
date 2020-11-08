FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"漢字ひらカタ"}
    last_name_kana        {"カンジ"}
    first_name            {"漢字ひらカタ"}
    first_name_kana       {"ヒラカタ"}
    birth_date            {"2000-01-01"}
  end
end
