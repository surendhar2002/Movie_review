# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'surendhar071@gmail.com', password: '123456', admin: true)

25.times do |_n|
  name = Faker::Movie.title
  re_date = Faker::Date.between(from: '1980-01-01', to: '2023-04-23')
  Movie.create!(name:, re_date:)
end