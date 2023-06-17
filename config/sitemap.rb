require 'fog/aws'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://rightruddermarketing.com"
SitemapGenerator::Sitemap.public_path = 'tmp/sitemap'
#SitemapGenerator::Sitemap.sitemaps_host = "http://s3.ap-south-1.amazonaws.com/example-bucket-name/"
#
#SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
#  "rrmsitemaps",
#  aws_access_key_id: ENV["s3_access_key_id"],
#  aws_secret_access_key: ENV["s3_secret_access_key"],
#  aws_region: us-east-2
#)

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
  aws_access_key_id: ENV["s3_access_key_id"],
  aws_secret_access_key: ENV["s3_secret_access_key"],
  fog_provider: 'AWS',
  fog_directory: 'rrmsitemaps',
  fog_region: 'us-east-2'
)

SitemapGenerator::Sitemap.sitemaps_host = "https://rrmsitemaps.s3.amazonaws.com"

# I don't think we need this..
# SitemapGenerator::Sitemap.create_index = true

SitemapGenerator::Sitemap.create do
  add '/schedule-call'
  add '/marketing-system'
  add '/about-us'
  add '/webinars'
  add '/flight-school-marketing-checklist'
  add '/notams'
  add '/careers'

 
  #services
  add '/website-design'
  add '/flight-school-website-design'
  #add '/search-engine-optimization'
  #add '/pay-per-click-ads'
  #add '/video-creation'
  #add '/email-campaigns'
  #add '/social-media-management'
  #add '/reputation-management'

  #legal
  add '/privacy-policy'
  add '/terms-of-service'

  #Add all notams
  Notam.find_each do |notam|
    add notam_path(notam), :lastmod => notam.updated_at
  end

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
