# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# AdminUser.create!(
#     email: 'read@example.com',
#     password: 'password',
#     password_confirmation: 'password',
#     role: 'read'
# ) if Rails.env.development?

require 'faker'
# 20.times do
# Country.create!(name: Faker::Name.unique.name,location: Faker::Address.country)
# end
# @countries = Country.all
# @countries.each do |c|
#   Region.create!(name: Faker::FunnyName.two_word_name,country_id: c.id)
# end

@regions =Region.all
@regions.pluck(:id).each do|c|
  City.create!(name: Faker::Name.female_first_name,location: Faker::Address.country,region_id: c)
end

