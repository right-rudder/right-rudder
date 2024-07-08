class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_rich_text :content
  broadcasts_to :task

  delegate :account, to: :task
end
