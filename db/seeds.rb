polo_a = Product.create!(
  name: "ポロシャツA",
  category: "shirt",
  price: 3000,
  description: "シンプルな白のポロシャツです。",
  image_url: "shirt1_1.jpg" 
)
polo_a.product_images.create!([
  { image_url: "shirt1_1.jpg", position: 1 }, 
  { image_url: "shirt1_2.jpg", position: 2 }, 
  { image_url: "shirt1_3.jpg", position: 3 }  
])

polo_b = Product.create!(
  name: "ポロシャツB",
  category: "shirt",
  price: 4200,
  description: "ビジネスカジュアルにも使える定番ポロシャツ。",
  image_url: "shirt2_1.jpg"
)
polo_b.product_images.create!([
  { image_url: "shirt2_1.jpg", position: 1 },
  { image_url: "shirt2_2.jpg", position: 2 },
  { image_url: "shirt2_3.jpg", position: 3 }
])


sneaker_a = Product.create!(
  name: "スニーカーA",
  category: "sneaker",
  price: 8000,
  description: "軽量で歩きやすい定番スニーカー。",
  image_url: "sneaker1_1.jpg"
)
sneaker_a.product_images.create!([
  { image_url: "sneaker1_1.jpg", position: 1 },
  { image_url: "sneaker1_2.jpg", position: 2 },
  { image_url: "sneaker1_3.jpg", position: 3 }
])

sneaker_b = Product.create!(
  name: "スニーカーB",
  category: "sneaker",
  price: 9500,
  description: "ボリュームソールのトレンドスニーカー。",
  image_url: "sneaker2_1.jpg"
)
sneaker_b.product_images.create!([
  { image_url: "sneaker2_1.jpg", position: 1 },
  { image_url: "sneaker2_2.jpg", position: 2 },
  { image_url: "sneaker2_3.jpg", position: 3 }
])

# ===== スウェット =====
sweat_a = Product.create!(
  name: "スウェットA",
  category: "sweat",
  price: 5000,
  description: "裏起毛であたたかいクルーネックスウェット。",
  image_url: "sweat1_1.jpg"
)
sweat_a.product_images.create!([
  { image_url: "sweat1_1.jpg", position: 1 },
  { image_url: "sweat1_2.jpg", position: 2 },
  { image_url: "sweat1_3.jpg", position: 3 }
])

sweat_b = Product.create!(
  name: "スウェットB",
  category: "sweat",
  price: 6200,
  description: "ビッグシルエットのロゴスウェット。",
  image_url: "sweat2_1.jpg"
)
sweat_b.product_images.create!([
  { image_url: "sweat2_1.jpg", position: 1 },
  { image_url: "sweat2_2.jpg", position: 2 },
  { image_url: "sweat2_3.jpg", position: 3 }
])


after_jacket = Product.create!(
  name: "アフタージャケットA",
  category: "after",
  price: 12000,
  description: "試合後や移動時に使える軽量ジャケット。",
  image_url: "after1_1.jpg"
)
after_jacket.product_images.create!([
  { image_url: "after1_1.jpg", position: 1 },
  { image_url: "after1_2.jpg", position: 2 },
  { image_url: "after1_3.jpg", position: 3 }
])

after_parka = Product.create!(
  name: "アフターパーカーA",
  category: "after",
  price: 9800,
  description: "リラックスタイムにぴったりなアフターパーカー。",
  image_url: "after2_1.jpg"
)
after_parka.product_images.create!([
  { image_url: "after2_1.jpg", position: 1 },
  { image_url: "after2_2.jpg", position: 2 },
  { image_url: "after2_3.jpg", position: 3 }
])


pants_a = Product.create!(
  name: "パンツA",
  category: "pants",
  price: 7000,
  description: "テーパードシルエットのカジュアルパンツ。",
  image_url: "pants1_1.jpg"
)
pants_a.product_images.create!([
  { image_url: "pants1_1.jpg", position: 1 },
  { image_url: "pants1_2.jpg", position: 2 },
  { image_url: "pants1_3.jpg", position: 3 }
])

pants_b = Product.create!(
  name: "パンツB",
  category: "pants",
  price: 8200,
  description: "ストレッチ素材で動きやすいスリムパンツ。",
  image_url: "pants2_1.jpg"
)
pants_b.product_images.create!([
  { image_url: "pants2_1.jpg", position: 1 },
  { image_url: "pants2_2.jpg", position: 2 },
  { image_url: "pants2_3.jpg", position: 3 }
])

puts "Seed: Products = #{Product.count}件 作成しました"
puts "Seed: ProductImages = #{ProductImage.count}件 作成しました"