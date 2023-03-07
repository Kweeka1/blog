require_relative '../../rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.create(user: User.second, post: Post.first) }

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
