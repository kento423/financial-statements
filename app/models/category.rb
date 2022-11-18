class Category < ApplicationRecord
  # インスタンスメソッド: category.itemsを使えるようにする
  has_many :items
end
