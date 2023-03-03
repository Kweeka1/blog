class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  validates :text, presence: true, length: { minimum: 2, maximum: 200 }

  def increment_comments_counter
    post.increment :comments_counter
    post.save
  end
end
