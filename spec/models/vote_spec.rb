require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) do
    User.create(name: 'test_user', email: 'test_user@test.com',
                username: 'user')
  end

  let(:article) do
    Article.create(author_id: user.id, title: 'My first article',
                   text: 'This is a post created for general use.',
                   image: 'myimage.jpg')
  end
  subject do
    described_class.new(user_id: user.id, article_id: article.id)
  end

  it 'is valid when all attributes are present' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
