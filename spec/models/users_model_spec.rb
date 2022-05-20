require 'rails_helper'

RSpec.describe 'User model Test', type: :model do
  subject do
    User.create!(name: 'Frank', email: 'frankly@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) { subject.save }

  it 'USer name not nil' do
    subject.name = nil
    expect(subject).to be_invalid
  end
end
