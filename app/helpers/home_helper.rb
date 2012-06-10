module HomeHelper
  def nav_link_to(url, title, icon)
    attributes = {}
    attributes[:class] = 'active' if url == url_for

    icon_class = "icon-#{icon}"
    icon_class << " icon-white" if url == url_for

    content_tag 'li', attributes do
      content_tag 'a', href: url do
        content_tag('i', '', class: icon_class) +
          content_tag('span', title)
      end
    end
  end
end
