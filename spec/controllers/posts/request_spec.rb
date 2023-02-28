require_relative '../../rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'index action' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'should return 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  context 'show action' do
    before(:example) do
      get '/users/1/posts/1'
    end

    it 'should return 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
