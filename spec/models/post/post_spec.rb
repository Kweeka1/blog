require_relative '../../rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.create(user: User.first, title: 'What is RSpec',
                text: 'RSpec is a computer domain-specific language testing tool written in the programming language' +
                      'Ruby to test Ruby code. It is a behavior-driven development' +
                      'framework which is extensively used in production applications.',
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
