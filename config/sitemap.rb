# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://rightruddermarketing.com"

SitemapGenerator::Sitemap.create_index = true

SitemapGenerator::Sitemap.create do
  add '/schedule-call'
  add '/marketing-system'
  add '/about-us'
  add '/webinars'
  #add '/careers'

  #Add all notams
  Notam.find_each do |notam|
    add notam_path(notam), :lastmod => notam.updated_at
  end

  #services
  add '/website-design'
  add '/search-engine-optimization'
  add '/pay-per-click-ads'
  add '/video-creation'
  add '/email-campaigns'
  add '/social-media-management'
  add '/reputation-management'

  #legal
  add '/privacy-policy'
  add '/terms-of-service'

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
