class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  broadcasts_to ->(notification) { "notifications" }, inserts_by: :prepend
  
  def mark_as_read!
    update(read_at: Time.current)
  end
end
