require_relative '../rails_helper'

RSpec.describe 'Post index page', type: :system do
  context 'index page' do
    it 'User should see the other user\'s profile picture' do
      visit user_posts_path('105')
      expect(page).to have_selector('img')
    end

    it 'User should see the other user\'s username' do
      visit user_posts_path('105')
      expect(page).to have_content('Peter')
    end

    it 'User should see the number of posts of all other users' do
      visit user_posts_path('105')
      expect(page).to have_content('Number of posts:')
    end

    it 'User should see a post title' do
      visit user_posts_path('105')
      expect(page).to have_content('What does API mean?')
    end

    it 'User should see some of a post`body' do
      visit user_posts_path('105')
      expect(page).to have_content('An application programming interface')
    end

    it 'User should see the first comments on a post' do
      visit user_posts_path('105')
      expect(page).to have_content('Mark: nice post')
    end

    it 'User should see how many comments a post has' do
      visit user_posts_path('105')
      expect(page).to have_content('Comments:')
    end

    it 'User should see how many likes a post has' do
      visit user_posts_path('105')
      expect(page).to have_content('Likes:')
    end

    it 'User should see a section for pagination' do
      visit user_posts_path('105')
      expect(page).to have_content('pagination')
    end

    it 'User should be able to check a post\'s show page' do
      visit user_posts_path('105')
      click_link 'What does API mean?'
      expect(page).to have_current_path('/users/105/posts/124')
    end
  end
end
