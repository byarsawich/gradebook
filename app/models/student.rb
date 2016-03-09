class Student < ActiveRecord::Base
  belongs_to :user
  has_many :teachers
  has_many :parents
  has_many :grades
end
