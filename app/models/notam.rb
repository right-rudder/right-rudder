class Notam < ApplicationRecord
  validates :status, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :notam_date, presence: true
  validates :author, presence: true
  validates :feature_image, presence: true
  validates :notam_body, presence: true
  
  has_one_attached :feature_image

  #belongs_to :featured_notam
end
