class Subject < ApplicationRecord
  belongs_to :creator, class_name: User.name, foreign_key: :created_by
  has_many :course_subjects
  has_many :tasks
  delegate :name, to: :creator
  scope :sorted, ->{order(title: :asc, created_at: :desc)}
  scope :availables,
    ->(added_subject_ids){where("id NOT IN (?)", added_subject_ids)}
end
