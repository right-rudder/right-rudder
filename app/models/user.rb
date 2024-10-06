class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
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
  has_many :managed_accounts, class_name: 'Account', foreign_key: 'account_manager_id'
  has_many :led_accounts, class_name: 'Account', foreign_key: 'lead_developer_id'
  has_many :account_users
  has_many :accounts, through: :account_users

  enum role: { user: 0, admin: 1 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  def resized_profile_image
    profile_image.variant(resize_to_limit: [300, 300]).processed
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def username_or_email
    username || email
  end
end
