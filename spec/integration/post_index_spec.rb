require_relative '../rails_helper'

RSpec.describe 'Post index page', type: :feature do
  context 'index page' do
    it 'User should see the other user\'s profile picture' do
      visit user_posts_path(User.first.id)
      expect(page).to have_selector('img')
    end

    it 'User should see the other user\'s username' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('Peter')
    end

    it 'User should see the number of posts of all other users' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('Number of posts:')
    end

    it 'User should see some of a post`body' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('Model–view–controller is a software architectural pattern')
    end

    it 'User should see the first comments on a post' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('John: Cool post.')
    end

    it 'User should see how many comments a post has' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('Comments:')
    end

    it 'User should see how many likes a post has' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('Likes:')
    end
  end

  context 'index page navigation links' do
    it 'User should be able to check a post\'s show page' do
      visit user_posts_path(User.first.id)
      click_link 'What is MVC pattern'
      expect(page).to have_current_path("/users/#{User.first.id}/posts/#{User.first.posts.first.id}")
    end

    it 'User should see a section for pagination' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('pagination')
    end

    it 'User should see a post title' do
      visit user_posts_path(User.first.id)
      expect(page).to have_content('What is MVC pattern')
    end
  end
end
