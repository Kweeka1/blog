require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Peter', photo: 'https://imgur.com/xF8eA5', bio: 'Hi my name is Peter', posts_counter: 0)
  post = Post.create(user: user, title: 'What is MVC pattern', text: 'Model–view–controller is a software architectural pattern commonly used for developing user interfaces that divide the related program logic into three interconnected elements.', comments_counter: 0, likes_counter: 0)
  subject { Like.create(user: user, post: post) }

  before { subject.save }

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end