class Content < ApplicationRecord
  # インスタンスメソッド: content.userを使えるようにする
  belongs_to :user
  # インスタンスメソッド: content.itemを使えるようにする
  belongs_to :item
  validates :amount, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
