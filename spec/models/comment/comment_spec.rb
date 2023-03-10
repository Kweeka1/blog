require_relative '../../rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.create(user: User.first, post: Post.first,
                   text: 'Very good post.')
  end

  before { subject.save }

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'text\'s length should be more than 2 characters' do
    subject.text = 'i'
    expect(subject).to_not be_valid
  end

  it 'text\'s length should be less than 200 characters' do
    subject.text = 'Model–view–controller is a software architectural pattern commonly used for developing' \
                   'user interfaces that divide the related program logic into three interconnected elements. ' \
                   'Model–view–controller is a software architectural pattern commonly used for developing user ' \
                   'interfaces that divide the related program logic'
    expect(subject).to_not be_valid
  end
end
