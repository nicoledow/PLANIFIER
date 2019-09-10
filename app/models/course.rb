class Course < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :teacher_id

  belongs_to :teacher
  has_many :lessons
end
