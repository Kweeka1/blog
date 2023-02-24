class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post
  after_save :increment_comments_counter

  validates_associated :post, :user

  validates :text, presence: true, length: { minimum: 2, maximum: 200 }

  private

  def increment_comments_counter
    post.increment :comments_counter
  end
end
