require_relative '../../rails_helper'

RSpec.describe 'Users', type: :feature do
  context "index view" do
    before(:example) do
      visit "/users/"
    end

    it "template body should match placeholder text" do
      expect(body).to have_text('Here is a list of users')
    end
  end

  context "show view" do
    before(:example) do
      visit "/users/1"
    end

    it "template body should match placeholder text" do
      expect(page).to have_text('Here is a some details for a given user')
    end
  end
end