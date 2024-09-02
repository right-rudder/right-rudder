class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  has_rich_text :content
  broadcasts_to :ticket
  after_create :send_notifications
  after_create :notify_mentioned_users
  enum variant: { comment: 0, date_change_note: 1, completed_note: 2, reopened_note: 3 }

  delegate :account, to: :ticket
  scope :variant_comment, -> { where(variant: :comment) }

  def created_today?
    created_at.to_date == Date.current
  end

  def created_yesterday?
    created_at.to_date == Date.yesterday
  end

  def created_this_year?
    created_at.year == Date.current.year
  end

  def created_this_week?
    created_at.to_date.cweek == Date.current.cweek
  end

  private

  def send_notifications
    users_to_notify = ticket.subscribers
    users_to_notify.each do |user_to_notify|
      Notification.create(recipient: user_to_notify, actor: user, action: "commented on", notifiable: ticket) if user_to_notify != user
      CommentMailer.with(comment: self, user: user_to_notify, actor: user).new_comment.deliver_later(wait: 5.seconds) if user_to_notify != user
    end
  end

  def notify_mentioned_users
    mentioned_users = User.where(username: content.body.to_s.scan(/@([\w.]+)/).flatten)
    mentioned_users.each do |mentioned_user|
      Notification.create(recipient: mentioned_user, actor: user, action: "mentioned you in a comment", notifiable: ticket) if mentioned_user != user
      CommentMailer.with(comment: self, user: mentioned_user, actor: user).mentioned.deliver_later(wait: 5.seconds) if mentioned_user != user
      ticket.subscribers << mentioned_user unless ticket.subscribers.include?(mentioned_user)
    end
  end
end
