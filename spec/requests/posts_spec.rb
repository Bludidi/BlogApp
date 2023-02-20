require 'rails_helper'

RSpec.describe "PostsController", type: :request do
  describe "GET posts_controller#index" do
    before(:example) { get '/users/:user_id/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' tempalte" do
      expect(response).to render_tempalte(:index)
    end
    it "renders 'index' body" do
      expect(response.body).to include('Showing all posts for user with id:')
    end
  end

  describe 'GET posts_controller#show' do
    before(:example) { get 'users/:user_id/posts/:post_id' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' tempalte" do
      expect(response).to render_tempalte(:show)
    end
    it "renders 'index' body" do
      expect(response.body).to include('Showing posts with id:')
    end
  end
end
