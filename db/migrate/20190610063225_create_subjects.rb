class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.integer :created_by, null: false
      t.text :description

      t.timestamps
    end
  end
end
