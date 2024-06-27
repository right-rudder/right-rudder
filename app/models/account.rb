class Account < ApplicationRecord
  has_many :tasks
  has_one_attached :logo

  def resized_logo
    logo.variant(resize_to_limit: [300, 300]).processed
  end
end
