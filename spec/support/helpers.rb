module Helpers
  def signup_user(full_name, username, email)
    visit signup_path
    fill_in('user_name', with: full_name)
    fill_in('user_username', with: username)
    fill_in('user_email', with: email)
    click_button('commit')
  end

  def login(username)
    visit login_path
    fill_in('session_username', with: username)
    click_button('commit')
  end

  def create_article(title, txt)
    click_link('Write an Article')
    fill_in('article_title', with: title)
    fill_in('article_text', with: txt)
    attach_file('article_image', './spec/support/test_img.jpg')
    check('categories_')
    click_button('commit')
  end

  def create_article_without_category(title, txt)
    click_link('Write an Article')
    fill_in('article_title', with: title)
    fill_in('article_text', with: txt)
    attach_file('article_image', './spec/support/test_img.jpg')
    click_button('commit')
  end
end
