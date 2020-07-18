# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# require 'addressable/uri'

Faker::Config.locale = 'ja'
position_list = ['一般','TL','GM','部長','室長','社長']
bumon_list = ['経営企画部','人事総務部','経理部','情報システム部','事業部１','事業部２','法務部','経営管理部','国内営業部']
busho_list = ['経理部','開発部１','開発部２','事業部１','事業部２','総務部','人事部','法務','知財','広報部','企画部','関東支店','東北支店','関西支店','北海道営業所','九州支店']
team_list =  ['連結チーム','広報チーム','経理部','インフラチーム','事業チーム１','事業チーム２','総務チーム','人事チーム','法務チーム','経営チーム','業務支援チーム','管理チーム','サポートチーム']
mobile_prefix = rand(10..99)
mobile_middle = rand(0000..9999)
mobile_suffix = rand(0000..9999)
mobile_list = "#{mobile_prefix}#{mobile_middle}#{mobile_suffix}"

100.times do
  gimei = Gimei.new
  emproyee_id = Faker::Number.unique.number(digits: 5)
  name = gimei.name.kanji
  name_kana = gimei.name.hiragana
  email = Faker::Internet.email
  dept1 = bumon_list[rand(8)]
  dept2 = busho_list[rand(16)]
  dept3 = team_list[rand(13)]
  position_name = position_list[rand(6)]
  location_name = gimei.prefecture.kanji
  location_name_kana = gimei.prefecture.hiragana
  # address_name = gimei.city.kanji
  # address_name_kana = gimei.city.hiragana
  tel_extention = rand(10000..99999)
  tel_outside = mobile_list
      # Faker::PhoneNumber.phone_number_with_country_code.gsub(/-/, '')
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
               location_name_kana: location_name_kana,
               # address_name: address_name,
               # address_name_kana: address_name_kana,
               tel_extention: tel_extention,
               tel_outside: tel_outside,
               tel_mobile: tel_mobile
  )
end
