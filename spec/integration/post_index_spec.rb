require_relative '../../ls_helper'

RSpec.describe 'Post index page', type: :system do
  context 'index page' do
    it 'User should see the other user\'s profile picture' do
      visit user_path('105')
      expect(page).to have_selector('img')
    end

    it 'User should see the other user\'s username' do
      visit user_path('105')
      expect(page).to have_content('Peter')
    end

    it 'User should see the number of posts of all other users' do
      visit user_path('105')
      expect(page).to have_content('Number of posts:')
    end

    it 'I can see a post' do
      visit user_path('105')
      expect(page).to have_content('What does API mean?')
    end

    it 'I can see some of a post`body' do
      visit user_path('105')
      expect(page).to have_content('An application programming interface')
    end
  end
end
