class Notam < ApplicationRecord
  validates :status, inclusion: { :in => ['Published','Drafting']}
  validates :title, presence: true
  validates :category, inclusion: { :in => ['Business and Marketing','Aviation and Flying', 'News and Announcement']}
  validates :notam_date, presence: true
  validates :author, presence: true
  validates :feature_image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/webp'], size_range: 1..(2.megabytes) }
  validates :notam_body, presence: true
  
  has_one_attached :feature_image

  #belongs_to :featured_notam
end
