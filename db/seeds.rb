# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times do |n|
	name = Faker::Name.name
	category = Faker::Lorem.characters(15)
	price = Faker::Commerce.price
	Product.create!(name: name, category: category, price: price)
end