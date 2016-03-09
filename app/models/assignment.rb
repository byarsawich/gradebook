class Assignment < ActiveRecord::Base
  belongs_to :teacher
  has_many :grades
end
