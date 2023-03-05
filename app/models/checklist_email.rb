class ChecklistEmail < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email
end
