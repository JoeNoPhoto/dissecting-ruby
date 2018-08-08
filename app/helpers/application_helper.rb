module ApplicationHelper
  def login_or_register_items
    [
      {
        url: new_user_registration_path,
        title: 'Register'
      },
      {
        url: new_user_session_path,
        title: 'Login'
      }
    ]
  end

  def login_helper(style, _tag_type=nil)
    login_link = ''
    if current_user.is_a?(GuestUser)
      login_or_register_items.each do |item|
        login_link << "#{_tag_type}<a href='#{item[:url]}' class='#{style}'> #{item[:title]}</a>"
      end
      login_link.html_safe
    else
      login_link << "#{_tag_type}<a href='#{destroy_user_session_path}' data-method='#{:delete}' class='#{style}'>Logout</a>"
    end
    login_link.html_safe
  end

  def source_helper layout_name
    if session[:source]
      source_page = "Thanks for visiting me from #{session[:source]}."
      layout_page = "You're using the #{layout_name} layout."
      content_tag(:p, source_page, class: "source-greeting") +
      content_tag(:p, layout_page, class: "layout-greeting")
    end
  end

  def copyright_generator
    JoeNoCoViewTool::Renderer.copyright 'JoeNo Co.', 'All Rights Reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end

  def nav_helper(style, _tag_type=nil)
    nav_links = ''
    nav_items.each do |item|
      nav_links << "#{_tag_type}<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'> #{item[:title]}</a>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end
end
