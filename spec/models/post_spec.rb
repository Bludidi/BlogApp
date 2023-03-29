require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'This is my title', comments_counter: 2, likes_counter: 0) }

  before { subject.save }

  it 'The title should be present' do
    subject.title.nil?
    expect(subject).to_not be_valid
  end

  it 'The title should not exceed 250 characters' do
    subject.title = 'This is my title' * 30
    expect(subject).to_not be_valid
  end

  it 'The comments_counter should be an integer not less than zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'The likes_counter should be an integer not less than zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end