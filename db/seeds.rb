# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do
  birthdate = rand(Date.civil(1960, 1, 1)..Date.civil(2015, 12, 31))
  icon = "http://www.asthmamd.org/images/icon_user_1.png"
  bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
  first_name = %w( Andrea Tori Dani Germaine Reese Jaden Angel Jesse Ariel Alex Cameron ).sample
  last_name = %w( Perry Rodriguez Villalobos Smith Torres Schrader Starkey Anderson Masters ).sample
  email = first_name + "+" + last_name + "@example.com"
  gender = %w( m f u ).sample

  Person.create :first_name => first_name, :last_name => last_name, :email => email, :gender => gender, :bio => bio, :picture => icon, :birthdate => birthdate
end
