require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(post_id: 9) }

  before { subject.save }

  it 'The post_id should be present' do
    subject.post_id.nil?
    expect(subject).to_not be_valid
  end

  it 'The post_id should be an integer' do 
    subject.post_id = '15'
    expect(subject).to_not be_valid
  end
end
