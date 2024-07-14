class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_rich_text :content
  broadcasts_to :task
  after_create :create_notifications

  delegate :account, to: :task

  private

  def create_notifications
    users_to_notify = task.users + [task.user] - [user]
    users_to_notify.uniq.each do |u|
      Notification.create!(recipient: u, actor: user, action: "commented on", notifiable: task)
    end
  end
end
