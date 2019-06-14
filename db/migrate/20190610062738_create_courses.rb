class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.integer :created_by, null: false
      t.text :description
      t.integer :status, default: 0, null: false
      t.date :start_date, default: Time.now
      t.date :finish_date, default: 60.days.from_now
      t.timestamps
    end
  end
end
