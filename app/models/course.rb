class Course < ApplicationRecord
  belongs_to :creator, class_name: User.name, foreign_key: :created_by
  has_many :subjects, through: :course_subjects
  has_many :trainees, through: :user_courses
end
