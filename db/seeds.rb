Product.create!(
  name: "ポロシャツA",
  category: "shirt",
  price: 3000,
  description: "シンプルな白のポロシャツです。",
  image_url: "shirt1.jpg"
)

Product.create!(
  name: "ポロシャツB",
  category: "shirt",
  price: 4200,
  description: "ビジネスカジュアルにも使える定番ポロシャツ。",
  image_url: "shirt2.jpg"
)

# スニーカー
Product.create!(
  name: "スニーカーA",
  category: "sneaker",
  price: 8000,
  description: "軽量で歩きやすい定番スニーカー。",
  image_url: "sneaker1.jpg"
)

Product.create!(
  name: "スニーカーB",
  category: "sneaker",
  price: 9500,
  description: "ボリュームソールのトレンドスニーカー。",
  image_url: "sneaker2.jpg"
)

# スウェット
Product.create!(
  name: "スウェットA",
  category: "sweat",
  price: 5000,
  description: "裏起毛であたたかいクルーネックスウェット。",
  image_url: "sweat1.jpg"
)

Product.create!(
  name: "スウェットB",
  category: "sweat",
  price: 6200,
  description: "ビッグシルエットのロゴスウェット。",
  image_url: "sweat2.jpg"
)

# アフター
Product.create!(
  name: "アフタージャケットA",
  category: "after",
  price: 12000,
  description: "試合後や移動時に使える軽量ジャケット。",
  image_url: "after1.jpg"
)

Product.create!(
  name: "アフターパーカーA",
  category: "after",
  price: 9800,
  description: "リラックスタイムにぴったりなアフターパーカー。",
  image_url: "after2.jpg"
)

# パンツ
Product.create!(
  name: "パンツA",
  category: "pants",
  price: 7000,
  description: "テーパードシルエットのカジュアルパンツ。",
  image_url: "pants1.jpg"
)

Product.create!(
  name: "パンツB",
  category: "pants",
  price: 8200,
  description: "ストレッチ素材で動きやすいスリムパンツ。",
  image_url: "pants2.jpg"
)

puts "Seed: Products = #{Product.count}件 作成しました"