class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.text    :description
      t.integer :price,       null: false
      t.string  :category,    null: false
      t.string  :image_url

      t.timestamps
    end
  end
end