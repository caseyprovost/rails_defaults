FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username }
    password { "google" }
  end
end
