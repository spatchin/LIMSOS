# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

user = User.new({email: 'test@example.com', password: 'password', password_confirmation: 'password'})
user.save
p user

empty_user = User.new({email: 'test2@example.com', password: 'password', password_confirmation: 'password'})
empty_user.save
p empty_user
