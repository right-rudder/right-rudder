class Ticket < ApplicationRecord
  belongs_to :account
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  has_rich_text :content
  has_many :assignments, dependent: :destroy
  has_many :assigned_users, through: :assignments, source: :user
  has_many :ticket_notifications, dependent: :destroy
  has_many :notified_users, through: :ticket_notifications, source: :user
  has_many :users, through: :comments
  has_many :ticket_subscriptions, dependent: :destroy
  has_many :subscribers, through: :ticket_subscriptions, source: :user

  enum repeat: {
    no: 0,
    every_day: 1,
    every_weekday: 2,
    every_week: 3,
    every_month: 4,
    every_year: 5
  }

  after_update :notify_users_if_completed
  after_create :create_future_tickets, if: :repeating_ticket?
  after_save :update_subscribers
  after_create :notify_assigned_users

  validates :repeat_until, presence: true, if: :repeating_ticket?
  validates :due_date, presence: true, if: :repeating_ticket?
  validate :repeat_until_after_today, if: :repeat_until_present?

  scope :completed, -> { where(completed: true).order(updated_at: :desc) }
  scope :incompleted, -> { where(completed: false) }
  scope :overdue, -> { incompleted.where("due_date < ?", Date.current).order(due_date: :asc).order(title: :asc) }
  scope :due_today, -> { incompleted.where(due_date: Date.current).order(due_date: :asc).order(title: :asc) }
  scope :due_tomorrow, -> { incompleted.where(due_date: Date.tomorrow).order(due_date: :asc).order(title: :asc) }
  scope :due_later_this_week, -> { incompleted.where(due_date: date_range_for_due_later_this_week).order(due_date: :asc).order(title: :asc) }
  scope :due_next_week, -> { incompleted.where(due_date: Date.current.end_of_week + 1.day..Date.current.end_of_week + 1.week).order(due_date: :asc).order(title: :asc) }
  scope :due_later_within_a_month, -> { incompleted.where(due_date: Date.current.beginning_of_week + 2.weeks..Date.current + 1.month).order(due_date: :asc).order(title: :asc) }
  scope :due_later, -> { incompleted.where("due_date > ?", Date.current + 1.month).order(due_date: :asc).order(title: :asc) }
  scope :no_due_date, -> { incompleted.where(due_date: nil).order(title: :asc) }
  scope :my_assigned_tickets, ->(user) { where(assigned_users: { id: user.id }) }

  def self.date_range_for_due_later_this_week
    if Date.current.saturday? || Date.current.sunday?
      nil
    else
      (Date.tomorrow + 1.day)..Date.current.end_of_week
    end
  end

  def due_this_week?
    due_date >= Date.current.beginning_of_week && due_date <= Date.current.end_of_week if due_date 
  end

  def create_notes(actor)
    create_note_on_date_change(actor)
    create_note_on_completion(actor)
    create_note_on_uncompletion(actor)
  end

  private

  def create_note_on_date_change(actor)
    comments.create(content: "🗓 <strong>#{actor.username} changed the due date</strong> from #{due_date_previously_was.strftime('%b %e, %Y')} to #{due_date.strftime('%b %e, %Y')}.", user: actor, variant: :date_change_note) if due_date_previously_changed?
  end

  def create_note_on_completion(actor)
    comments.create(content: "✅ <strong>#{actor.username} completed</strong> this squawk.", user: actor, variant: :completed_note) if completed_previously_changed? && completed?
  end

  def create_note_on_uncompletion(actor)
    comments.create(content: "❌ <strong>#{actor.username} re-opened</strong> this squawk.", user: actor, variant: :reopened_note) if completed_previously_changed? && !completed?
  end

  def update_subscribers
    users_to_subscribe = assigned_users.to_a + notified_users.to_a
    users_to_subscribe << creator unless users_to_subscribe.include?(creator)

    users_to_subscribe.each do |user|
      ticket_subscriptions.find_or_create_by(user: user)
    end
  end

  def notify_users_if_completed
    if completed_previously_changed? && completed?
      notified_users.each do |user|
        TicketMailer.with(ticket: self, user: user).completed_ticket.deliver_later(wait: 5.seconds)
      end
    end
  end

  def notify_assigned_users
    assigned_users.each do |user|
      TicketMailer.with(ticket: self, user: user, actor: creator).assigned_ticket.deliver_later(wait: 5.seconds) unless user == creator
    end
  end

  def repeating_ticket?
    repeat != "no"
  end

  def repeat_until_present?
    repeat_until.present?
  end

  def create_future_tickets
    case repeat
    when 'every_day'
      create_recurring_tickets(1.day)
    when 'every_weekday'
      create_weekday_tickets
    when 'every_week'
      create_recurring_tickets(1.week)
    when 'every_month'
      create_recurring_tickets(1.month)
    when 'every_year'
      create_recurring_tickets(1.year)
    end
  end

  def create_recurring_tickets(interval)
    date = due_date
    loop do
      date += interval
      break if repeat_until.present? && date > repeat_until
      Ticket.create(
        title:,
        content:,
        due_date: date,
        account:,
        creator:,
        assigned_user_ids:,
        notified_user_ids:,
      )
    end
  end

  def create_weekday_tickets
    date = due_date
    loop do
      date = next_weekday(date)
      break if repeat_until.present? && date > repeat_until
      Ticket.create(
        title:,
        content:,
        due_date: date,
        account:,
        creator:,
        assigned_user_ids:,
        notified_user_ids:,
      )
    end
  end

  def next_weekday(date)
    loop do
      date += 1.day
      break if (1..5).include?(date.wday)
    end
    date
  end

  def repeat_until_after_today
    if repeat_until < Date.current
      errors.add(:repeat_until, "must be after today")
    end
  end
end
