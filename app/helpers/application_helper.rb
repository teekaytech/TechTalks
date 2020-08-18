module ApplicationHelper
  def categories_by_priority
    Category.order_by_priority
  end

  def category_recent_article(category)
    return unless category.articles.recent_article.nil?

    category.articles.recent_article
  end

  def banner_image
    context = featured_article
    return image_tag 'default_banner.jpg', class: 'w-100 h-100 f-image img-fluid' if context.nil?

    image_tag context.image.banner.url, class: 'w-100 h-100 f-image img-fluid'
  end

  def banner_header(article)
    content_tag :div, class: 't-header ml-3' do
      if article.nil?
        content_tag(:p, 'Welcome to TechTalks', class: 'm-0 p-0') +
          content_tag(:em, 'Home of tech - related articles...', class: 'sub-header')
      else
        link_to(article.title, article_path(article), class: 't-link mb-1 d-block') +
          content_tag(:p, article.text.truncate(100), class: 'l-header')
      end
    end
  end

  def categories_thumbnails(category)
    if !category_with_recent_article(category).nil?
      image_tag(category_with_recent_article(category).image.thumb.url,
                class: 'w-100 h-100 f-image img-fluid') +
        link_to(category_with_recent_article(category).title,
                article_path(category_with_recent_article(category)), class: 'details-title')
    else
      image_tag 'default_logo.png', class: 'mt-4 img-fluid'
    end
  end

  def header_navigations(user)
    if user
      content_tag(:li, link_to('categories', categories_path),
                  class: 'nav-item') +
        content_tag(:li, link_to(
                           'Write an Article', new_article_path
                         ), class: 'nav-item') +
        content_tag(:li,
                    link_to('logout', logout_path(user), method: :delete),
                    class: 'nav-item')
    else
      content_tag(:li, link_to('Login', login_path),
                  class: 'nav-item') +
        content_tag(:li, link_to('Register', signup_path),
                    class: 'nav-item pl-2')
    end
  end
end
