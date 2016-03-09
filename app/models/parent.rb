class Parent < ActiveRecord::Base
  include Person
  belongs_to :student
end
