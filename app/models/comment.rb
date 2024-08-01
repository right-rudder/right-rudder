class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  has_rich_text :content
  broadcasts_to :ticket
  after_create :create_notifications

  delegate :account, to: :ticket

  private

  def create_notifications
    users_to_notify = ticket.users + [ticket.user]
    users_to_notify.uniq.each do |user_to_notify|
      Notification.create!(recipient: user_to_notify, actor: user, action: "commented on", notifiable: ticket) if user_to_notify != user
    end
  end
end
