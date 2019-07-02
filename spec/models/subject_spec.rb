require "rails_helper"

RSpec.describe Subject, type: :model do
  describe "validations tests" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(255) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(1000) }
    it { should belong_to(:creator) }
    it { should have_many(:tasks) }
    it { should have_many(:course_subjects) }
    it { should delegate_method(:name).to(:creator) }
  end

  describe "scope tests" do
    let!(:subject_one) { create(:subject, title: "Laravel")}
    let!(:subject_two) { create(:subject, title: "Django",
                                          created_at: 10.days.from_now)}
    let!(:subject_three) { create(:subject, title: "Rails",
                                            created_at: -10.days.ago)}
    let!(:course_subject) { create(:course_subject, subject: subject_one)}

    it "should return a sorted subject list" do
      expect(Subject.sorted.first.title).to eq(subject_two.title)
    end

    it "should remove a subject from available list after added" do
      subjects = Subject.availables([subject_one.id])
      index = subjects.index {|subject| subject.title == subject_one.title }
      expect(index).to be_nil
    end
  end
end
