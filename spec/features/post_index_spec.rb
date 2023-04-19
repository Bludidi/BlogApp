require 'rails_helper'

RSpec.describe 'post index page', type: :feature do
  describe 'Post Index' do
    before(:each) do
      @user1 = User.create(name: 'Buntu', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', bio: 'Lecturer', posts_counter: 1)

      visit root_path

      @post1 = Post.create(title: 'First post', text: 'This is my first post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @post2 = Post.create(title: 'Second post', text: 'This is my second post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @post3 = Post.create(title: 'Third post', text: 'This is my third post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @comment1 = Comment.create(text: 'First comment', author_id: @user1.id, post_id: @post1.id)
      @comment2 = Comment.create(text: 'Second comment', author_id: @user1.id, post_id: @post1.id)
      @comment3 = Comment.create(text: 'Third comment', author_id: @user1.id, post_id: @post1.id)
    
      visit user_posts_path(@user1, @post1)
    end

    it 'Displays user image' do
      expect(page).to have_css("img[src*='/assets/user-e0d132cde4d0d334866caab060fa0172c7014d4b4902552aa1f9cee896163198.png']")
    end

    it 'display user name' do
      expect(page).to have_content(@user1.name)
    end

    it 'displays the number of user posts' do
      expect(page).to have_content(@user1.posts_counter)
    end

    it 'display the title of post' do
      expect(page.body).to match(/first\s+post/i)
    end

    it 'display the body of post' do
      expect(page).to have_content(@post1.text)
    end

    it 'displays the first comment of a user' do
      expect(page).to have_content(@comment1.text)
    end

    it 'displays number of comments in a post' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'displays number of likes in a post' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'displays pagination button' do
      expect(page).to have_button('Pagination')
    end

    it 'redirect to post show page' do
      visit user_posts_path(@user1)
      click_link @post1.text
      expect(page).to have_current_path user_post_path(@user1, @post1)
    end
  end
end