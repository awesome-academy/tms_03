class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  scope :course_subjects, ->(course_id){where("course_id = ?", course_id)}
end
