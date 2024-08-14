class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :tickets
  has_many :comments
  has_many :assignments
  has_many :assigned_tickets, through: :assignments, source: :ticket
  has_many :ticket_notifications, dependent: :destroy
  has_many :notified_tickets, through: :ticket_notifications, source: :ticket
  has_many :notifications, foreign_key: :recipient_id
  has_many :ticket_subscriptions, dependent: :destroy
  has_many :subscribed_tickets, through: :ticket_subscriptions, source: :ticket

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
