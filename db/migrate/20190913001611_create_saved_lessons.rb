class CreateSavedLessons < ActiveRecord::Migration
  def change
    create_table :saved_lessons do |t|
      t.integer :saving_teacher_id
      t.integer :saved_lesson_id
    end
  end
end
