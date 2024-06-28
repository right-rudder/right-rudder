class Task < ApplicationRecord
  belongs_to :account
  validates :title, presence: true

  scope :completed, -> { where(completed: true).order(updated_at: :desc) }
  scope :incompleted, -> { where(completed: false) }
  scope :overdue, -> { incompleted.where("due_date < ?", Date.today).order(due_date: :asc).order(title: :asc) }
  scope :due_today, -> { incompleted.where(due_date: Date.today).order(due_date: :asc).order(title: :asc) }
  scope :due_tomorrow, -> { incompleted.where(due_date: Date.tomorrow).order(due_date: :asc).order(title: :asc) }
  scope :due_later_this_week, -> { incompleted.where(due_date: Date.tomorrow + 1.day..Date.today.end_of_week).order(due_date: :asc).order(title: :asc) }
  scope :due_next_week, -> { incompleted.where(due_date: Date.today.end_of_week + 1.day..Date.today.end_of_week + 1.week).order(due_date: :asc).order(title: :asc) }
  scope :due_later, -> { incompleted.where("due_date > ?", Date.today.end_of_week + 1.week).order(due_date: :asc).order(title: :asc) }
end
