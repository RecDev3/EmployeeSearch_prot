# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Uaer.create(emproyee_id: '11111', name: 'aaaa', dept1: '経営管理部', dept2: '経営管理', dept3: '経営管理チーム', email: 'hoge@hoge.co.jp', created_at: '2020-05-09 13:46:20 UTC')
# User.create(emproyee_id: '11234',	name: '壷田貴弘', dept1: "経営企画部", dept2: '経営管理', dept3: '経営管理チーム', email: 'ttt.tsubota@anest-iwata.co.jp', created_at:'2020-05-09 13:46:20 UTC')
# 33333	出村好	情報システム部		インフラ管理T	konomi.demura@anest-iwata.co.jp	2020-05-09 07:29:20 UTC
# 11111	渡辺雄太	品質保証部		品質保証T	yuta.watanabe@anest-iwata.co.jp	2020-05-09 13:57:59 UTC
# 22222	上駄あかり	経営企画部	IR広報室		akari.ueda@anest-iwata.co.jp	2020-05-09 08:57:47 UTC
# 23432	岡田直樹	経営管理本部	経理G	経理T	hoge@hoge.co.jp	2020-05-10 11:09:32 UTC
# 44444	栗本崇司	情報システム部	技術管理室	技術管理T	takashi.kurimoto@anest-iwata.co.jp	2020-05-10 02:41:13 UTC
# 55555	島崎洋介	国内営業本部	元AICS	元AICS	yosuke.shimazaki@anest-iwata.co.jp	2020-05-10 05:56:32 UTC
# 88888	管理者	管理者	管理者	管理者	kami@kami.jp	2020-05-10 05:18:45 UTC

100.times do |n|
  emproyee_id = Faker::Address.zip,
  name = Faker::Name.name,
  dept1 = Faker::Name.title,
  dept2 = Faker::Name.title,
  dept3 = Faker::Name.title,
  email = Faker::Internet.email,
  created_at = Faker::Business.credit_card_expiry_date
  User.create!(
      emproyee_id: emproyee_id,
      name: name,
      dept1: dept1,
      dept2: dept2,
      dept3: dept3,
      email: email,
      created_at: created_at
  )
end


# 100.times do |n|
#   User.create!(
#     emproyee_id: "1111#{n + 1}",
#     name: "テスト#{n + 1}",
#     dept1: "#{n + 1}部",
#     dept2: "#{n + 1}グループ",
#     dept1: "#{n + 1}チーム",
#     email: "test#{n + 1}@test.com",
#     created_at: "2020-05-13 13:46:20 UTC"
#   )
#