require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Tom', posts_counter: 2) }

  before { subject.save }

  it 'The name should not be blank' do
    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'The posts_counter should be an integer' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'The posts_counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'The posts_counter be not less than zero' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end
end 