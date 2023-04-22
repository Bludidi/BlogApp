class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  after_create :increase_posts_counter
  after_destroy :update_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_comment
    comments.order(created_at: :desc).limit(5)
  end

  def increase_posts_counter
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end

  # def decrease_posts_counter
  #   author_id = author.id
  #   User.decrement_counter(:posts_counter, author_id)
  # end

  def update_posts_counter
    author.update(posts_counter: author.posts.length)
  end
end
