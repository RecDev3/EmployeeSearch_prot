# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'addressable/uri'

Faker::Config.locale = 'ja'

100.times do
  gimei = Gimei.new
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
  tel_extention = rand(00001..99999)
  tel_outside = Faker::PhoneNumber.phone_number_with_country_code.gsub(/-/, '')
  tel_mobile = Faker::PhoneNumber.cell_phone.gsub(/-/, '')
  User.create!(
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
               tel_extention: tel_extention,
               tel_outside: tel_outside,
               tel_mobile: tel_mobile
  )
end
