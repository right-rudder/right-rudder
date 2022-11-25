class NewsletterEmail < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email
end
