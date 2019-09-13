class CreateSavedLessons < ActiveRecord::Migration
  def change
    create_table :saved_lessons do |t|
      t.integer :saving_teacher_id
      t.integer :lesson_id
    end
  end
end
