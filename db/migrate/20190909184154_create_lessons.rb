class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :objectives
      t.string :content
      t.string :assessment
      t.integer :course_id
    end
  end
end
