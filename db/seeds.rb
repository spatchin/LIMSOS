# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'clearing database...'

User.destroy_all
Feedstock.destroy_all
Harvest.destroy_all
Biomass.destroy_all
BiomassType.destroy_all
Workspace.destroy_all

WORKSPACES = [
               [1, 'Feedstock Management', 'leaf', 'success', [Biomass, BiomassType, Feedstock, Harvest]],
               [2, 'Inventory Management', 'list-ol', 'warning', [Inventory, InventoryBatch, InventoryHydrolysate, InventoryUntreatedFeedstock, InventoryPretreatedFeedstock, Material, MaterialType, Supplier]],
               [3, 'Administration', 'book', 'primary', [User, Workspace], true]
             ]

puts 'seeding...'
WORKSPACES.each do |ws|
  Workspace.create({id: ws[0], name: ws[1], icon: ws[2], color: ws[3], models: ws[4], admin_only: ws[5] ? true : false})
end

user = User.new({username: Faker::Internet.domain_word, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test@example.com', password: 'password', password_confirmation: 'password'})
user.save!

user2 = User.new({username: Faker::Internet.domain_word, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test2@example.com', password: 'password', password_confirmation: 'password'})
user2.save!

admin_user = User.new({username: Faker::Internet.domain_word, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'Admin'})
admin_user.save!

1000.times do
  a = Biomass.create(name: Faker::Beer.name)
  a.owner = user
  a.save!

  b = BiomassType.create(name: Faker::Beer.style)
  b.owner = user
  b.save!

  c = Feedstock.create(amount: Faker::Number.positive.floor, unit: %w(g lb kg).sample)
  c.owner = user
  c.save!

  d = Harvest.create(plot_location: Faker::Address.street_address, plot_information: Faker::Hacker.say_something_smart, planting_date: Faker::Time.backward(100))
  d.owner = user
  d.save!
end

materials = {id: [1, 2, 3, 4, 5, 6],
             name: ['Switchgass 2009', 'Switchgrass 2015', 'SG AFEX 2015', 'Hydrolysate SG AFEX 2015', 'Cellic Ctec 2', 'Cellic Htec 2'],
             mattype_code: ['UFS', 'UFS', 'PFS', 'FH', 'EZ', 'EZ'],
             default_unit_code: ['bag', 'bag', 'kg', 'l', 'kg', 'kg'],
}

6.times do |i|
  m = Material.create(id: materials[:id][i],
                      name: materials[:name][i],
                      mattype_code: materials[:mattype_code][i],
                      default_unit_code: materials[:mattype_code][i])
  m.owner = user
  m.save!
end

puts 'done'
