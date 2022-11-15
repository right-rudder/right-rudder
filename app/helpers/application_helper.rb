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

  # OG Image
  def og_image(image_url)
    content_for :og_image, image_url
  end

  # Twitter Image
  def twitter_image(text)
    content_for :twitter_image, text
  end

end
