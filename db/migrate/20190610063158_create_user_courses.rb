class CreateUserCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_courses do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false
      t.integer :assigned_by, null: false
      t.integer :status, default: 0, null: false
      t.datetime :deadline

      t.timestamps
    end
  end
end
