require 'rails_helper'

RSpec.describe 'users_controller', type: :system do
  before :each do
    User.create(name: 'Taofeek', username: 'teekay', email: 'tfk@gmail.com')
  end

  it 'register on the platform' do
    signup_user('taofeek', 'checkthisusername', 'taofeek@gmail.com')
    expect(page).to have_content 'Welcome to TechTalks!'
  end

  it 'fails to register user with already used username' do
    signup_user('taofeek', 'teekay', 'taofeek@gmail.com')
    expect(page).to have_content 'Username has already been taken'
  end

  it 'log in registered user' do
    login('teekay')
    expect(page).to have_content 'Welcome back'
  end

  it 'do not login when username is not valid' do
    login('teekaytech')
    expect(page).to have_content 'Invalid username..., try again.'
  end
end
