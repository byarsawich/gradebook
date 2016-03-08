# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


teacher = Role.create(name: "Teacher", role: 1)
student = Role.create(name: "Student", role: 2)
parent = Role.create(name: "Parent", role: 3)

teacher.users << User.new(email: "shout@devil.com", password: "kickstart")
student.users << User.new(email: "punk@dead.com", password: "monkey")
