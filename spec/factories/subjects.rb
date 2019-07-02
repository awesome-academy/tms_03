FactoryBot.define do
  factory :subject do
    title { Faker::ProgrammingLanguage.name }
    description { "Lorem ipsum" }
    creator { create(:supervisor) }
  end
end
