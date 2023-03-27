class User < ApplicationRecord
  has_many :comments, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  after_save :most_recent_post
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_post
    posts.order(created_at: :desc).includes(:user).limit(3)
  end
end
