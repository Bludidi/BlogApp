require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'post show' do
    before(:each) do
      @user1 = User.create(name: 'Buntu', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', bio: 'Lecturer', posts_counter: 1)
      @user2 = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', bio: 'Police Officer', posts_counter: 2)

      visit root_path

      @post1 = Post.create!(title: 'First post', text: 'This is my first post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @post2 = Post.create!(title: 'Second post', text: 'This is my second post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @post3 = Post.create!(title: 'Third post', text: 'This is my third post', comments_counter: 1, likes_counter: 1, author_id: @user1.id)
      @comment1 = Comment.create(text: 'First comment', author_id: @user1.id, post_id: @post1.id)
      @comment2 = Comment.create(text: 'Second comment', author_id: @user1.id, post_id: @post1.id)
      @comment3 = Comment.create(text: 'Third comment', author_id: @user1.id, post_id: @post1.id)
    
      visit user_posts_path(@user1, @post1)
    end

    it 'display the post title' do
      expect(page.body).to match(/first\s+post/i)
    end

    it 'display post author name' do
      expect(page).to have_content(@user1.name)
    end

    it 'display the post body' do
      expect(page).to have_content(@post1.text)
    end

    it 'displays the user name for commenter' do
      expect(page).to have_content(@user1.name)
    end

    it 'displays number of comments in a post' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'displays number of likes in a post' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'displays comment body' do
      expect(page.body).to have_content(@comment1.text)
    end
  end
end