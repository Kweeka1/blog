require_relative '../../rails_helper'

RSpec.describe 'Users', type: :request do
  context 'index action' do
    before(:example) do
      get '/users'
    end

    it 'should return 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  context 'show action' do
    it 'should return 200 status code' do
      get '/users/1/'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      get '/users/1/'
      expect(response).to render_template('show')
    end
  end
end
