class Teacher < ActiveRecord::Base
  has_many :courses
  has_many :lessons, through: :courses
end
