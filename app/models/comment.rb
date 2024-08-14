class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  has_rich_text :content
  broadcasts_to :ticket
  after_create :send_notifications

  delegate :account, to: :ticket

  private

  def send_notifications
    users_to_notify = ticket.subscribers - [user]
    users_to_notify.each do |user_to_notify|
      Notification.create!(recipient: user_to_notify, actor: user, action: "commented on", notifiable: ticket) if user_to_notify != user
      CommentMailer.with(comment: self, user: user_to_notify, actor: user).new_comment.deliver_later
    end
  end
end
