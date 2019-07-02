FactoryBot.define do
  factory :course do
    title { Faker::ProgrammingLanguage.name }
    description { "Lorem ipsum" }
    creator { create(:supervisor) }
  end
end
