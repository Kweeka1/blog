class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates_associated :posts, :likes, :comments

  validates :name, length: { minimum: 2, maximum: 30 }, allow_blank: false
  validates :bio, length: { maximum: 500 }, allow_blank: true
  validates :photo,
            format: { with: %r{\A(http|https)://[a-z0-9]+([-.][a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}i }
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def show_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
