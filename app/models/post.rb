class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, foreign_key: :author_id
  after_save :increment_posts_counter

  validates_associated :likes, :comments, :user

  validates :title, length: { maximum: 250 }, allow_blank: false
  validates :text, presence: true, length: { minimum: 100, maximum: 500 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def show_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    user.increment :posts_counter
  end
end
