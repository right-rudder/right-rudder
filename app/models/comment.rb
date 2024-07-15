class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_rich_text :content
  broadcasts_to :task
  after_create :create_notifications

  delegate :account, to: :task

  private

  def create_notifications
    users_to_notify = task.users + [task.user]
    users_to_notify.uniq.each do |user_to_notify|
      Notification.create!(recipient: user_to_notify, actor: user, action: "commented on", notifiable: task) if user_to_notify != user
    end
  end
end
