class CreateUserSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_subjects do |t|
      t.integer :user_id, null: false
      t.integer :course_subject_id, null: false
      t.integer :status, default: 0, null: false
      t.datetime :deadline

      t.timestamps
    end
  end
end
