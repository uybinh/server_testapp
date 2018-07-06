module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Clubhouse App"
    full_page_title = page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end
end
