class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :tasks
  has_many :comments
  has_many :assignments
  has_many :assigned_tasks, through: :assignments, source: :task
  has_many :task_notifications, dependent: :destroy
  has_many :notified_tasks, through: :task_notifications, source: :task
  has_many :notifications, foreign_key: :recipient_id

  def resized_profile_image
    profile_image.variant(resize_to_limit: [300, 300]).processed
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def username
    first_name || email
  end
end
