FactoryBot.define do
  factory :course_subject do
    course { create(:course) }
    subject { create(:subject) }
  end
end
