require 'rails_helper'

RSpec.describe 'users/show.html.rb', type: :feature do
  describe 'User show page' do
    before(:each) do
      @user1 = User.create(name: 'Buntu', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', posts_counter: 2, bio: 'Lecturer')
      @user2 = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', bio: 'Police Officer', posts_counter: 2)

      visit root_path

      @post1 = Post.create(title: 'First post', text: 'This is my first post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @post2 = Post.create(title: 'Second post', text: 'This is my second post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @post3 = Post.create(title: 'Third post', text: 'This is my third post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)

      visit user_path(@user1.id)
    end

    it 'displays name of a user' do
      expect(page.body).to have_content(@user1.name)
    end

    it 'Displays user image' do
      expect(page).to have_css("img[src*='/assets/user-e0d132cde4d0d334866caab060fa0172c7014d4b4902552aa1f9cee896163198.png']")
    end

    it 'displays number of posts of a user' do
      expect(page.body).to have_content(@user1.posts_counter)
    end

    it 'displays user bio' do
      expect(page.body).to have_content(@user1.bio)
    end

    it 'displays user first three posts' do
      expect(page.body).to have_content(@post1.text)
      expect(page.body).to have_content(@post2.text)
      expect(page.body).to have_content(@post3.text)
    end

    it 'displays a button to show all posts' do
      expect(page).to have_button('Show all posts')
    end

    it 'redirects to post show page' do
      click_link @post1.text
      expect(page).to have_current_path user_post_path(@user1.id, @post1)
    end

    it 'when I click on Show all posts it redirects me to user posts index page' do
      click_on 'Show all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end