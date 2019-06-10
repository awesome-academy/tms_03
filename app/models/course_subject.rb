class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  enum status: {opened: 0, closed: 1}
end
