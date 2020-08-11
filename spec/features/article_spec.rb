require 'rails_helper'

RSpec.describe 'articles_controller', type: :system do
  let(:category) { Category.create(name: 'programming', priority: 1) }

  before :each do
    Category.create(name: 'communication', priority: 2)
    User.create(name: 'Taofeek', username: 'teekay', email: 'tfk@gmail.com')
  end

  it 'creates an article' do
    login('teekay')
    create_article('Testing Article', 'content' * 10)
    expect(page).to have_content 'Article created successfully'
  end

  it 'fails to create an article when content is less than 20' do
    login('teekay')
    create_article('Testing Article', 'content')
    expect(page).to have_content 'Text is too short (minimum is 20 characters)'
  end

  it 'fails to create an article when no category is selected' do
    login('teekay')
    create_article_without_category('Testing Article', 'content')
    expect(page).to have_content 'Please select at least one category.'
  end

  it 'votes for an article' do
    login('teekay')
    create_article('Testing Article', 'content' * 10)
    click_link('communication')
    click_link('Vote')
    expect(page).to have_content 'Voting successful'
  end
end
