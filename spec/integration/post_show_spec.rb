require_relative '../rails_helper'

RSpec.describe 'Post show page', type: :system do
  context 'index page' do
    it 'I can see a post title' do
      visit user_post_path('1', '1')
      expect(page).to have_content('What is MVC pattern')
    end

    it 'I can see who wrote the post' do
      visit user_post_path('1', '1')
      expect(page).to have_content('What is MVC pattern by Peter')
    end

    it 'I can see how many comments it has' do
      visit user_post_path('1', '1')
      expect(page).to have_content('Comments:')
    end

    it 'I can see how many likes it has' do
      visit user_post_path('1', '1')
      expect(page).to have_content('Likes:')
    end

    it 'I can see the post body' do
      visit user_post_path('1', '1')
      expect(page).to have_content('Model–view–controller is a software architectural pattern commonly used' +
                                    ' for developing user interfaces that divide the related' +
                                     ' program logic into three interconnected elements.')
    end

    it 'User can see the username of each comment' do
      visit user_post_path('1', '1')
      expect(page).to have_content('John:')
    end

    it 'User can see the username of each comment' do
      visit user_post_path('1', '1')
      expect(page).to have_content('John: Cool post.')
    end
  end
end
