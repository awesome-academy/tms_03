class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.integer :course_id, null: false
      t.integer :subject_id, null: false
      t.boolean :status, default: true, null: false
      t.date :start_date, default: Time.now
      t.date :finish_date, default: 5.days.from_now
      t.timestamps
    end
  end
end
