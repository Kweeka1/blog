require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Peter', photo: 'https://imgur.com/xF8eA5', bio: 'Hi my name is Peter', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'photo should be a valid link' do
    subject.photo = 'my photo'
    expect(subject).to_not be_valid
  end

  it 'bio can be blank' do
    subject.bio = nil
    expect(subject).to be_valid
  end

  it 'posts counter should be greater or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
