module ApplicationHelper

  # Title Changer
  def title(text)
    content_for :title, text
  end

end
