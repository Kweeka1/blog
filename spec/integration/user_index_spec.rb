require_relative '../rails_helper'

RSpec.describe 'users index page', type: :system do
  context 'index page' do
    it 'User should see the username of all other users' do
      visit root_path
      expect(page).to have_content('John')
      expect(page).to have_content('Peter')
    end

    it 'User should see the pictures of all other users' do
      visit root_path
      expect(page).to have_selector('img')
    end

    it 'User should see the number of posts of all other users' do
      visit root_path
      expect(page).to have_content('Number of posts:')
    end

    it 'User should be able to visit the profiles of all other users' do
      visit root_path
      click_link 'Peter'
      expect(page).to have_content('Bio')
    end
  end
end
