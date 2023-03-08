class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  after_initialize :init

  validates :name, length: { minimum: 2, maximum: 30 }, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def admin?
    role == 'admin'
  end

  def show_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def init
    return unless posts_counter.nil?

    self.posts_counter = 0
  end
end
