require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  describe 'User index page' do
    before(:each) do
      @user1 = User.create(name: 'Buntu', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', bio: 'Lecturer', posts_counter: 1)
      @user2 = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', bio: 'Police Officer', posts_counter: 2)
    
      visit users_path
    end

    it 'Displays the names of all users' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'Displays user image' do
      expect(page).to have_css("img[src*='/assets/user-e0d132cde4d0d334866caab060fa0172c7014d4b4902552aa1f9cee896163198.png']")
    end

    it 'Displays user number of posts' do
      visit users_path
      expect(page).to have_content(@user1.posts_counter)
      expect(page).to have_content(@user2.posts_counter)
    end

    it 'has correct link' do
      expect(page).to have_link(@user1.name, href: user_path(@user1))
      expect(page).to have_link(@user2.name, href: user_path(@user2))
    end

    it 'Redirects to User show page' do
      click_link('Buntu')
      expect(page).to have_content('Buntu')
    end
  end
end