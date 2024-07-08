class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :tasks
  has_many :comments

  def resized_profile_image
    profile_image.variant(resize_to_limit: [300, 300]).processed
  end
end
