class Teacher < ActiveRecord::Base
  include Person
  
  belongs_to :user
  has_many :students
  has_many :assignments
end
