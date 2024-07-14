FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name_with_middle}
    email {Faker::Internet.email}
    password {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana { ["タナカ", "サトウ", "スズキ", "タカハシ", "ワタナベ"].sample }
    first_name_kana { ["タナカ", "サトウ", "スズキ", "タカハシ", "ワタナベ"].sample }
    birthday {Faker::Date.backward(days: 10000)}
  end
end