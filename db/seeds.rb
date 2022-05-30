# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'kanrisya@kanrisya.com',
  password: 'kanrisya',
)

Genre.create!(
  name: 'ケーキ',
)

Genre.create!(
  name: 'プリン',
)

Genre.create!(
  name: '焼き菓子',
)

Genre.create!(
  name: 'キャンディ',
)

Item.create!(
  genre_id:0,
  name: "いちごのショートケーキ（ホール）",
  introduction: "栃木産のとちおとめを贅沢に使用しています。",
  price: "2500",
  is_active: true
  )

  100.times do |n|
    Customer.create!(
      last_name: "test#{n + 1}山",
      first_name: "test#{n + 1}太郎子",
      last_name_kana: "test#{n + 1}ヤマ",
      first_name_kana: "test#{n + 1}タロウコ",
      email: "test#{n + 1}@test.jp",
      password: "testpass",
      postal_code: "1500041",
      address: "東京都渋谷区神南１丁目１９−１１ パークウェースクエア24#{n + 1}",
      telephone_number: "0123456789",
      is_active: true
      )
  end