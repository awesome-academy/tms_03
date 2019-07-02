FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :trainee, class: User do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "password" }
    password_confirmation { "password" }
    role { 2 }
  end

  factory :supervisor, class: User do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "password" }
    password_confirmation { "password" }
    role { 1 }
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "password" }
    password_confirmation { "password" }
    role { 0 }
  end
end
