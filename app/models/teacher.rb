class Teacher < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :name 
  
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /\w+@\w+\.\w+/}
          
  has_many :courses
  has_many :lessons, through: :courses
  
end
