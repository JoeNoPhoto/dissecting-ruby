module ApplicationHelper
  def login_helper style
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
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
end
