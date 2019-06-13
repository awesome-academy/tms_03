class Subject < ApplicationRecord
  belongs_to :creator, class_name: User.name, foreign_key: :created_by
  has_many :tasks
  scope :sorted, ->{order(title: :asc, created_at: :desc)}
end
