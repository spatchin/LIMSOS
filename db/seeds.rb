# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Feedstock.destroy_all
Harvest.destroy_all
Biomass.destroy_all
BiomassType.destroy_all

user = User.new({username: Faker::Internet.domain_word, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test@example.com', password: 'password', password_confirmation: 'password'})
user.save
p user

user2 = User.new({username: Faker::Internet.domain_word, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test2@example.com', password: 'password', password_confirmation: 'password'})
user2.save
p user2

admin_user = User.new({username: Faker::Internet.domain_word, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'Admin'})
admin_user.save
p admin_user

100.times do |i|
  a = Biomass.create(name: Faker::Beer.name)
  a.owner = user
  a.save!
  p a

  b = BiomassType.create(name: Faker::Beer.style)
  b.owner = user
  b.save!
  p b

  c = Feedstock.create(amount: Faker::Number.positive.floor, unit: %w(g lb kg).sample)
  c.owner = user
  c.save!
  p c

  d = Harvest.create(plot_location: Faker::Address.street_address, plot_information: Faker::Hacker.say_something_smart, planting_date: Faker::Time.backward(100))
  d.owner = user
  d.save!
  p d
end
