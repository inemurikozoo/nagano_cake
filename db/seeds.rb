# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'kanrisya@kanrisya.com',
  password: 'kanrisya'
)

Genre.create!(
  name: "ケーキ"
)

Genre.create!(
  name: "プリン"
)

Genre.create!(
  name: "焼き菓子"
)

Genre.create!(
  name: "キャンディ"
)

Item.create!(
  genre_id: 1,
  name: "いちごのショートケーキ（ホール）",
  introduction: "栃木産のとちおとめを贅沢に使用しています。",
  price: 2500,
  )

Item.create!(
  genre_id: 1,
  name: "洋梨のチーズタルト",
  introduction: "北海道産チーズを使用したコクのあるチーズタルトです。",
  price: 1200,
  is_active: true
  )

Item.create!(
  genre_id: 1,
  name: "ザッハトルテ",
  introduction: "甘すぎないチョコレートを使った飽きない味の自信作です。",
  price: 2900,
  is_active: true
  )

Item.create!(
  genre_id: 1,
  name: "モンブラン",
  introduction: "後味にこだわった、パティシエの渾身の一作をプチプラで。",
  price: 500,
  is_active: true
  )

Item.create!(
  genre_id: 2,
  name: "卵たっぷり濃厚プリン",
  introduction: "厳選された素材のみを使った、超濃厚プリンです。",
  price: 500,
  is_active: true
  )


Item.create!(
  genre_id: 3,
  name: "紅茶のクッキー",
  introduction: "紅茶の香りが楽しめるしっとり食感のクッキーです。ご贈答にもどうぞ。5枚入り。",
  price: 800,
  is_active: true
  )

Item.create!(
  genre_id: 1,
  name: "フルーツタルト",
  introduction: "桃、パイナップル、リンゴをふんだんに使い、食感豊かに仕上げました。",
  price: 2900,
  is_active: false
  )

Item.create!(
  genre_id: 2,
  name: "かぼちゃのプリン",
  introduction: "かぼちゃの風味が楽しめる、卵不使用のプリンです。",
  price: 480,
  is_active: false
  )

Item.create!(
  genre_id: 2,
  name: "マカロンセット（8個）",
  introduction: "看板商品、雲のマカロンがお求めやすいセットになりました。",
  price: 1200,
  is_active: true
  )

Item.create!(
  genre_id: 2,
  name: "マカロンセット（16個）",
  introduction: "看板商品、雲のマカロンがお求めやすいセットになりました。",
  price: 2000,
  is_active: false
  )
  
Item.create!(
  genre_id: 1,
  name: "バナナケーキ",
  introduction: "お子様に大人気！食べやすい優しい味のバナナケーキです。",
  price: 2000,
  is_active: true
  )

30.times do |n|
  Item.create!(
    genre_id: 4,
    name: "バナナケーキ#{n + 1}",
    introduction: "お子様に大人気！食べやすい優しい味のバナナケーキです。#{n + 1}",
    price: 200 * n,
    is_active: true
    )
end

30.times do |n|
  Customer.create!(
    email: "test#{n + 1}@test.com",
    password: "123456",
    last_name: "姓#{n + 1}",
    first_name: "名#{n + 1}",
    last_name_kana: "メイ",
    first_name_kana: "セイ",
    postal_code: "1234567",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    telephone_number: "09012345678",
    is_active: true
  )
end

20.times do |n|
  Order.create!(
    customer_id: n + 1,
    postal_code: "123456#{n + 1}",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4#{n + 1}階",
    name: "test#{n + 1}",
    payment_amount: n + 5250,
    postage: 800,
    pay_type: 0,
    status: 0
  )
end

5.times do |n|
  OrderItem.create!(
    item_id: n + 1,
    order_id: n + 1,
    amount: n + 2,
    price: 1000 + (n * 1000),
    status: 0
  )
end