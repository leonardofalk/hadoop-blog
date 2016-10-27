module ApplicationHelper
  def nav_menu(name, path, icon)
    content_tag :li, class: ('active' if current_page?(path)) do
      link_to(path) do
        fa_icon(icon) << content_tag(:span, name, class: 'nav-label')
      end
    end
  end
end
