require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) do
    User.create(name: 'test_user', email: 'test_user@test.com',
                username: 'user')
  end
  subject do
    described_class.new(author_id: user.id, title: 'My first article',
                        text: 'This is a post created for general use.',
                        image: 'myimage.jpg')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid when title is blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when title is not blank' do
    subject.title = 'Capstone Project'
    expect(subject).to be_valid
  end

  it 'is invalid when text is blank' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when text is not blank' do
    subject.text = 'Here is the summary of the project' * 5
    expect(subject).to be_valid
  end

  it 'is valid when image is attached' do
    subject.image = 'myimage.jpg'
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:votes) }
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:categories) }
  end
end
