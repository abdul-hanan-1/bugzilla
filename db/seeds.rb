require 'faker'
# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

manager1 = User.create(name: "michael", email: "michael@gmail.com", password:"password", password_confirmation: "password",user_type: "manager")

manager2 = User.create(name: "schrute", email: "schrute@gmail.com", password:"password", password_confirmation: "password",user_type: "manager")

manager3 = User.create(name: "dwight", email: "dwight@gmail.com", password:"password", password_confirmation: "password",user_type: "manager")

5.times do
  manager1.projects.create(manager: manager1.name, title: Faker::Name.name)
  manager2.projects.create(manager: manager2.name, title: Faker::Name.name)
  manager3.projects.create(manager: manager3.name, title: Faker::Name.name)
end


dev1 = User.create(name: "kevin", email: "kevin@gmail.com", password:"password", password_confirmation: "password",user_type: "developer")

dev2 = User.create(name: "andy", email: "andy@gmail.com", password:"password", password_confirmation: "password",user_type: "developer")

dev3 = User.create(name: "ryan", email: "ryan@gmail.com", password:"password", password_confirmation: "password",user_type: "developer")

qa1 = User.create(name: "oscar", email: "oscar@gmail.com", password:"password", password_confirmation: "password",user_type: "qa")

qa2 = User.create(name: "creed", email: "creed@gmail.com", password:"password", password_confirmation: "password",user_type: "qa")

qa3 = User.create(name: "morty", email: "morty@gmail.com", password:"password", password_confirmation: "password",user_type: "qa")

puts 'Test Users Created!'