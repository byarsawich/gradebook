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

User.create_user(email: "shout@devil.com", password: "kickstart",type: "Teacher", user_hash: {first_name: "John", last_name: "Doe"})
User.create_user(email: "punk@dead.com", password: "monkey", type: "Teacher", user_hash: {first_name: "John", last_name: "McClane"})

4.times do
  User.create_user(email: Faker::Internet.email, password: "123456", type: "Student", user_hash: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, teacher_id: 1})
end

4.times do
  User.create_user(email: Faker::Internet.email, password: "123456", type: "Student", user_hash: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, teacher_id: 2})
end

9.times do |i|
  User.create_user(email: Faker::Internet.email, password: "parent", type: "Parent", user_hash: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, student_id: i + 1})
  User.create_user(email: Faker::Internet.email, password: "parent", type: "Parent", user_hash: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, student_id: i + 1})
end

5.times do
  Assignment.create(teacher_id: 1, name: Faker::App.name, duedate: Faker::Date.between(10.days.ago, Date.today))
  Assignment.create(teacher_id: 2, name: Faker::App.name, duedate: Faker::Date.between(10.days.ago, Date.today))
end

50.times do |i|
  Grade.create(student_id: i % 10 + 1, assignment_id: i / 10 + 1, grade: Faker::Number.between(50, 100))
end
