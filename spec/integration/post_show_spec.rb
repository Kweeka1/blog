require_relative '../rails_helper'

RSpec.describe 'Post show page', type: :system do
  context 'index page' do

    it 'I can see a post title' do
      visit user_post_path('105', '124')
      expect(page).to have_content('What does API mean?')
    end

    it 'I can see who wrote the post' do
      visit user_post_path('105', '124')
      expect(page).to have_content('What does API mean? by Peter')
    end

    it 'I can see how many comments it has' do
      visit user_post_path('105', '124')
      expect(page).to have_content('Comments:')
    end

    it 'I can see how many likes it has' do
      visit user_post_path('105', '124')
      expect(page).to have_content('Likes:')
    end

    it 'I can see the post body' do
      visit user_post_path('105', '124')
      expect(page).to have_content('An application programming interface is a way for two or more computer programs to communicate with each other. It is a type of software interface, offering a service to other pieces of software.')
    end

    it 'User can see the username of each comment' do
      visit user_post_path('105', '124')
      expect(page).to have_content('Mark:')
    end

    it 'User can see the username of each comment' do
      visit user_post_path('105', '124')
      expect(page).to have_content('Mark: nice post')
    end
  end
end
