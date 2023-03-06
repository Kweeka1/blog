require_relative '../rails_helper.rb'

RSpec.describe 'Show page', type: :system do
  context 'Show page' do
    it 'User should see the other user\'s profile picture' do
      visit user_path('105')
      expect(page).to have_selector('img')
    end

    it 'User should see the other user\'s username' do
      visit user_path('105')
      expect(page).to have_content('Peter')
    end

    it 'User should see the number of posts of other users' do
      visit user_path('105')
      expect(page).to have_content('Number of posts:')
    end

    it 'User should see the bio of other users' do
      visit user_path('105')
      expect(page).to have_content('Bio')
    end

    it 'User should see the recent posts of other users' do
      visit user_path('105')
      expect(page).to have_content('What does API mean?')
      expect(page).to have_content('When to use Reactjs ?')
      expect(page).to have_content('What is MVC pattern')
    end

    it 'User should be able to see view all post button' do
      visit user_path('105')
      expect(page).to have_content('See all Post')
    end

    it 'User should be able to click another user\'s post and redirects him to that post\'s show page' do
      visit user_path('105')
      click_link 'What is MVC pattern'
      expect(page).to have_current_path('/users/105/posts/122')
    end

    it 'User should be able to see all posts of other user' do
      visit user_path('105')
      click_link 'See all Post'
      expect(page).to have_current_path('/users/105/posts')
    end
  end
end
