require 'rails_helper'

RSpec.describe 'articles_controller', type: :system do
  let(:category) { Category.create(name: 'communication', priority: 1) }

  before :each do
    User.create(name: 'Taofeek', username: 'teekay', email: 'tfk@gmail.com')
  end

  it 'creates an article' do
    login('teekay')
    create_article('Testing Article', 'content' * 10, category.id)
    expect(page).to have_content 'Article created successfully'
  end

  it 'votes for an article' do
    login('teekay')
    create_article('Testing Article', 'content' * 10, category.id)
    click_link(category.name)
    click_link('Vote')
    expect(page).to have_content 'Voting successful'
  end
end
