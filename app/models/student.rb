class Student < ActiveRecord::Base
  include Person
  
  belongs_to :user
  has_many :teachers
  has_many :parents
  has_many :grades
end
