class Lesson < ActiveRecord::Base
  validates_presence_of :title
  
  belongs_to :course
end
