class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :course_subject
  enum status: {in_progress: 0, finished: 1}
end
