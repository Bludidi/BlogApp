 require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
     @post = Post.create(AuthorId: subject.id, title: 'check post',
                         text: 'Unit test for the method of most_recent_posts')
    @comment = Comment.create(AuthorId: subject.id, PostId: @post.id,
                              text: 'Unit test for the method of most_recent_comments')
  end

  it 'Text should match with the input text' do
    text = @comment.text

    expect(text).to eq('Unit test for the method of most_recent_comments')
  end
end
