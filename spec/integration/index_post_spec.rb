require_relative '../../ls_helper'

RSpec.describe 'Post index page', type: :system do
  context 'index page' do

    it 'I can see a post' do
      visit user_post('105', '1')
      expect(page).to have_content('What does API mean?')
    end

    it 'I can see who wrote the post' do
      visit user_post('105', '1')
      expect(page).to have_content('Peter')
    end

    it 'I can see how many comments it has' do
      visit user_post('105', '1')
      expect(page).to have_content('Comments: 2')
    end

    it 'I can see how many likes it has' do
      visit user_post('105', '1')
      expect(page).to have_content('Likes: 2')
    end

    it 'I can see the post body' do
      visit user_post('105', '1')
      expect(page).to have_content('An application programming interface is a way for two or more computer programs to communicate with each other. It is a type of software interface, offering a service to other pieces of software.')
    end
  end
end
