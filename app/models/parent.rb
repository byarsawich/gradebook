class Parent < ActiveRecord::Base
  include Person
  belongs_to :user
  belongs_to :student
end
