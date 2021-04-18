class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
