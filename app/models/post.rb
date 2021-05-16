class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments,        dependent: :destroy
  has_many :post_comment_replies, dependent: :destroy
  has_many :likes,                dependent: :destroy
  has_many :users,                through: :likes

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :title,   presence: true, uniqueness: { scope: :user_id }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
