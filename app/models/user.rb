class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  # インスタンスメソッド: user.contentsを使えるようにする
  has_many :contents
#   has_many :has_contents, through: :contents, source: :content

#   def follow(other_user)
#     unless self == other_user
#       self.relationships.find_or_create_by(follow_id: other_user.id)
#     end
#   end

#   def unfollow(other_user)
#     relationship = self.relationships.find_by(follow_id: other_user.id)
#     relationship.destroy if relationship
#   end

#   def following?(other_user)
#     self.followings.include?(other_user)
#   end
  
#   def feed_microposts
#     Micropost.where(user_id: self.following_ids + [self.id])
#   end
  
#   def add_to_favorites(micropost)
#     # 自分自身の投稿もお気に入りできる
#     self.favorites.find_or_create_by(micropost_id: micropost.id)
#   end
  
#   def remove_from_favorites(micropost)
#     favorite = self.favorites.find_by(micropost_id: micropost.id)
#     favorite.destroy if favorite
#   end
  
#   def favoring?(micropost)
#     self.favoposts.include?(micropost)
#   end
end