class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.integer :course_id, null: false
      t.integer :subject_id, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
