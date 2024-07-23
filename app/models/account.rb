class Account < ApplicationRecord
  has_many :tickets
  has_one_attached :logo

  delegate :overdue, :due_today, :due_tomorrow, :due_later_this_week, :due_next_week, :due_later, :completed, to: :tickets, prefix: true
  delegate :my_assigned_tickets, to: :tickets

  def resized_logo
    logo.variant(resize_to_limit: [300, 300]).processed
  end
end
