class CreateCommentToPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_to_posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
