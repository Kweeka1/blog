class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, foreign_key: :author_id
  after_destroy :decrement_posts_counter

  validates :title, length: { maximum: 250 }, allow_blank: false
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def show_recent_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  def increment_posts_counter
    user.increment :posts_counter
    user.save
  end

  def decrement_posts_counter
    user.decrement :posts_counter
    user.save
  end
end
