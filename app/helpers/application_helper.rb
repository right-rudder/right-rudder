module ApplicationHelper

  # Title Changer
  def title(text)
    content_for :title, text
  end

  # Meta Description Changer
  def meta_description(text)
    content_for :meta_description, text
  end

  # Meta Keywords Changer
  def meta_keywords(text)
    content_for :meta_keywords, text
  end

  # OG Picture
  def og_picture(text)
    content_for :og_picture, text
  end

  # Twitter Picture
  def twitter_picture(text)
    content_for :twitter_picture, text
  end

end
