class Teacher < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :password, :name  
  has_many :courses
  has_many :lessons, through: :courses
end
