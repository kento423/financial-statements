class Item < ApplicationRecord
  # インスタンスメソッド: item.categoryを使えるようにする
  belongs_to :category
  # インスタンスメソッド: item.contentsを使えるようにする
  has_many :contents
  
  # マスタデータ以外のその他に対するバリデーション
  validates :name, presence: true, length: { maximum: 255 }
end
