module ApplicationHelper
  def link_to_nav(title, path)
    content_tag :li, class: ('active' if current_page?(path)) do
      link_to t("navbar.#{title}"), path
    end
  end
end
