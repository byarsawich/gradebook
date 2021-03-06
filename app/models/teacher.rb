class Teacher < ActiveRecord::Base
  include Person

  belongs_to :user
  has_many :students, dependent: :destroy
  has_many :assignments, dependent: :destroy
end
