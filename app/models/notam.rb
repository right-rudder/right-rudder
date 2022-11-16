class Notam < ApplicationRecord
  validates :status, presence: true
  validates :category, presence: true
  
  has_one_attached :feature_image
end
