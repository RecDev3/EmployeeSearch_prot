# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'addressable/uri'

Faker::Config.locale = 'ja'

# 20.times do
#   image = Faker::Avatar.image
#   emproyee_id = Faker::Number.number(digits: 5)
#   name = Faker::Name.unique.name
#   # name = Faker::JapaneseMedia::DragonBall.unique.character
#   email = Faker::Internet.email
#   dept1 = Faker::Company.industry
#   dept2 = Faker::Company.industry
#   dept3 = Faker::Company.industry
#   position_name = Faker::Music.genre
#   location_name = Faker::Address.state
#   # location_name_kana =
#   address_name = Faker::Address.full_address
#   # address_name_kana =
#   zip_number = Faker::Address.zip_code
#   tel_outside = Faker::PhoneNumber.phone_number_with_country_code
#   tel_extention = Faker::PhoneNumber.extension
#   tel_mobile = Faker::PhoneNumber.cell_phone.gsub(/-/, '')
#   User.create!(image: image, emproyee_id: emproyee_id, name: name, email: email, dept1: dept1, dept2: dept2, dept3: dept3,
#                position_name: position_name, location_name: location_name, address_name: address_name,
#                zip_number: zip_number, tel_outside: tel_outside, tel_mobile: tel_mobile, tel_extention: tel_extention)
# end

20.times do
  gimei = Gimei.new
  # FIXME Fakerで遊んだあと
  # uri = Addressable::URI.parse(Faker::Avatar.image(slug = nil, size = '100x100', format = 'png'))
  # image = uri.normalize
  # FIXME ローカルにおいた画像をデフォルトにする
  # image = File.open(File.join(Rails.root, "emproyee-image.png"))
  emproyee_id = Faker::Number.number(digits: 5)
  name = gimei.name.kanji
  name_kana = gimei.name.hiragana
  email = Faker::Internet.email
  dept1 = Faker::Company.industry
  dept2 = Faker::Company.industry
  dept3 = Faker::Company.industry
  position_name = Faker::Music.genre
  location_name = gimei.prefecture.kanji
  # location_name_kana =
  address_name = Faker::Address.full_address
  # address_name_kana =
  zip_number = Faker::Address.zip_code
  tel_outside = Faker::PhoneNumber.phone_number_with_country_code
  tel_extention = Faker::PhoneNumber.extension
  tel_mobile = Faker::PhoneNumber.cell_phone.gsub(/-/, '')
  User.create!(
               # image: image,
               emproyee_id: emproyee_id,
               name: name,
               name_kana: name_kana,
               email: email,
               dept1: dept1,
               dept2: dept2,
               dept3: dept3,
               position_name: position_name,
               location_name: location_name,
               address_name: address_name,
               zip_number: zip_number,
               tel_outside: tel_outside,
               tel_extention: tel_extention,
               tel_mobile: tel_mobile
  )
end
