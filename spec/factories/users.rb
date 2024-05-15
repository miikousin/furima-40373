FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"a1" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day             {Faker::Date.backward}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_kana             {person.last.katakana}
    first_kana            {person.first.katakana}
  end
end
