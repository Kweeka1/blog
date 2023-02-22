class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: :author_id
  after_save :increment_likes_counter

  private

  def increment_likes_counter
    post.increment :likes_counter
  end
end
