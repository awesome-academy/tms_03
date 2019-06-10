class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  enum status: {in_progress: 0, finished: 1}
end
