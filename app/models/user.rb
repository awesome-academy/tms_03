class User < ApplicationRecord
  has_many :created_courses, class_name: Course.name, foreign_key: :created_by
  has_many :assigned_courses, class_name: Course.name, foreign_key: :user_id
  has_many :tasks, through: :user_tasks
  has_many :reports
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  enum role: {admin: 0, supervisor: 1, trainee: 2}
  scope :sorted, ->{order(name: :asc, created_at: :desc)}
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable
end
