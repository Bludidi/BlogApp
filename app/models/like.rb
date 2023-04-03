class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  after_create :update_likes_counter

  def update_likes_counter
    post_id = post.id
    Post.increment_counter(:likes_counter, post_id)
  end
end
