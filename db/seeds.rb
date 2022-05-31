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

# Item.create!(
#   genre_id: 0,
#   name: "いちごのショートケーキ（ホール）",
#   introduction: "栃木産のとちおとめを贅沢に使用しています。",
#   price: "2500",
#   is_active: true
#   )

20.times do |n|
  Customer.create!(
    email: "test#{n + 1}@test.com",
    password: "123456",
    first_name: "名#{n + 1}",
    last_name: "姓#{n + 1}",
    first_name_kana: "セイ",
    last_name_kana: "メイ",
    postal_code: "1234567",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    telephone_number: "09012345678"
  )
end

# 8.times do |n|
#   Order.create!(
#     customer_id: n + 1,
#     address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
#     postal_code: "123456#{n + 1}",
#     name: "test#{n + 1}",
#     postage: "800",
#     payment_amount: "#{500 * ( n + 1 ) +800}",
#     payment_method: "クレジットカード",
#     status: 0
#   )
# end