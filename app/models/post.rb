class Post < ApplicationRecord
  belongs_to :user
  has_many :comment_to_posts, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
