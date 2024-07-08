class Task < ApplicationRecord
  belongs_to :account
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  has_rich_text :content

  scope :completed, -> { where(completed: true).order(updated_at: :desc) }
  scope :incompleted, -> { where(completed: false) }
  scope :overdue, -> { incompleted.where("due_date < ?", Date.current).order(due_date: :asc).order(title: :asc) }
  scope :due_today, -> { incompleted.where(due_date: Date.current).order(due_date: :asc).order(title: :asc) }
  scope :due_tomorrow, -> { incompleted.where(due_date: Date.tomorrow).order(due_date: :asc).order(title: :asc) }
  scope :due_later_this_week, -> { incompleted.where(due_date: date_range_for_due_later_this_week).order(due_date: :asc).order(title: :asc) }
  scope :due_next_week, -> { incompleted.where(due_date: Date.current.end_of_week + 1.day..Date.current.end_of_week + 1.week).order(due_date: :asc).order(title: :asc) }
  scope :due_later, -> { incompleted.where("due_date > ?", Date.current.end_of_week + 1.week).order(due_date: :asc).order(title: :asc) }

  def self.date_range_for_due_later_this_week
    if Date.current.saturday? || Date.current.sunday?
      nil
    else
      (Date.tomorrow + 1.day)..Date.current.end_of_week
    end
  end

  def due_this_week?
    due_date >= Date.current.beginning_of_week && due_date <= Date.current.end_of_week
  end
end
