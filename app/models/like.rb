class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: :author_id

  def increment_likes_counter
    post.increment :likes_counter
  end
end
