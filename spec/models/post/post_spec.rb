require_relative '../../rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Peter', photo: 'https://imgur.com/xF8eA5', bio: 'Hi my name is Peter', posts_counter: 0)
  subject do
    Post.create(user:, title: 'What is MVC pattern',
                text: 'Model–view–controller is a software architectural pattern commonly used for developing ' \
                      'user interfaces that divide the related program logic into three interconnected elements.',
                comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'title shouldn\'t be blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'title shouldn\'t exceed 250 characters' do
    subject.title = 'Model–view–controller is a software architectural pattern commonly used for developing  ' \
                    'user interfaces that divide the related program logic into three interconnected elements. ' \
                    'Model–view–controller is a software architectural pattern commonly used for developing user ' \
                    'interfaces that divide the related program logic into three interconnected elements.'
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be greater or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
