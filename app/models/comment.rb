class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  has_rich_text :content
  broadcasts_to :ticket
  after_create :notify_subscribers, :notify_mentioned_users

  enum variant: { user_made: 0, date_change_note: 1, completed_note: 2, reopened_note: 3 }

  delegate :account, to: :ticket

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

  def mentioned_users
    User.where(username: extract_usernames_from_content)
  end

  private

  def notify_subscribers
    ticket.subscribers.each do |subscriber|
      next if subscriber == user
      create_new_comment_notification(subscriber)
      send_subscriber_mail(subscriber)
    end
  end

  def notify_mentioned_users
    mentioned_users.each do |mentioned_user|
      next if mentioned_user == user
      create_mention_notification(mentioned_user)
      send_mention_mail(mentioned_user)
      ticket.subscribers << mentioned_user unless ticket.subscribers.include?(mentioned_user)
    end
  end

  def create_new_comment_notification(recipient)
    Notification.create(recipient: recipient, actor: user, action: "commented on", notifiable: ticket)
  end
  
  def create_mention_notification(mentioned_user)
    Notification.create(recipient: mentioned_user, actor: user, action: "mentioned you in a comment", notifiable: ticket)
  end

  def send_subscriber_mail(subscriber)
    mailer_action = case
                    when completed_note? then :completed
                    when reopened_note? then :reopened
                    when date_change_note? then :date_change
                    else :new_comment
                    end

    CommentMailer.with(comment: self, user: subscriber, actor: user).send(mailer_action).deliver_later(wait: 5.seconds)
  end

  def send_mention_mail(mentioned_user)
    CommentMailer.with(comment: self, user: mentioned_user, actor: user).mentioned.deliver_later(wait: 5.seconds)
  end

  def extract_usernames_from_content
    content.body.to_s.scan(/@([\w.]+)/).flatten
  end
end
