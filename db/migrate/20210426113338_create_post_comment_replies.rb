class CreatePostCommentReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comment_replies do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :post_comment_id
      t.text :content

      t.timestamps
    end
  end
end
