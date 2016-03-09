class Student < ActiveRecord::Base
  include Person

  belongs_to :user
  belongs_to :teachers
  has_many :parents, dependent: :destroy
  has_many :grades, dependent: :destroy

end
