class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, foreign_key: :author_id

  def show_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_posts_counter
    user.increment :posts_counter
  end
end
