class Account < ApplicationRecord
  has_many :tickets
  has_one_attached :logo
  belongs_to :account_manager, class_name: 'User', foreign_key: 'account_manager_id', optional: true
  belongs_to :lead_developer, class_name: 'User', foreign_key: 'lead_developer_id', optional: true
  has_many :account_users
  has_many :users, through: :account_users

  delegate :overdue, :due_today, :due_tomorrow, :due_later_this_week, :due_next_week, :due_later_within_a_month, :due_later, :no_due_date, :completed, to: :tickets, prefix: true
  delegate :user_assigned_tickets, to: :tickets

  def resized_logo
    logo.variant(resize_to_limit: [300, 300]).processed
  end

  def invite_user(user)
    account_users.create(user: user)
  end
end
