# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Faker::Config.locale = 'ja'

20.times do
  image = Faker::Avatar.image
  emproyee_id = Faker::Number.number(digits: 5)
  # name = Faker::Name.unique.name
  name = Faker::JapaneseMedia::DragonBall.unique.character
  email = Faker::Internet.email
  dept1 = Faker::Company.industry
  dept2 = Faker::Company.industry
  dept3 = Faker::Company.industry
  position_name = Faker::Music.genre
  location_name = Faker::Address.state
  # location_name_kana =
  address_name = Faker::Address.full_address
  # address_name_kana =
  zip_number = Faker::Address.zip_code
  tel_outside = Faker::PhoneNumber.phone_number_with_country_code
  tel_extention = Faker::PhoneNumber.extension
  tel_mobile = Faker::PhoneNumber.cell_phone.gsub(/-/, '')
  User.create!(image: image, emproyee_id: emproyee_id, name: name, email: email, dept1: dept1, dept2: dept2, dept3: dept3,
               position_name: position_name, location_name: location_name, address_name: address_name,
               zip_number: zip_number, tel_outside: tel_outside, tel_mobile: tel_mobile, tel_extention: tel_extention)
end
