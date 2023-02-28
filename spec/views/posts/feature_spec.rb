require_relative '../../rails_helper'

RSpec.describe 'Posts', type: :feature do
  context "index view" do
    before(:example) do
      visit "/users/1/posts"
    end

    it "template body should match placeholder text" do
      expect(body).to have_text('Here is a list of posts for a given user')
    end
  end

  context "show view" do
    before(:example) do
      visit "/users/1/posts/1"
    end

    it "template body should match placeholder text" do
      expect(page).to have_text('Here is a specific post for a given user')
    end
  end
end
