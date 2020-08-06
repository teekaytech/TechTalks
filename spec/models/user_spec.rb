require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'User1', email: 'test_user@test.com',
                        username: 'user')
  end

  it 'is valid with valid attributes' do expect(subject).to be_valid end

  it 'is invalid when name is absent' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid when username is absent' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when username is present' do
    subject.username = 'myusername'
    expect(subject).to be_valid
  end

  it 'is invalid when length of name is less than 5' do
    subject.name = 'this'
    expect(subject).to_not be_valid
  end

  it 'is invalid without a valid email' do
    subject.email = 'testuser@'
    expect(subject).to_not be_valid
  end

  it 'is valid with a valid email' do
    subject.email = 'testuser@gmail.com'
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
