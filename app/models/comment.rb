class Comment < ApplicationRecord
  belongs_to :task
  broadcasts_to :task
  has_rich_text :content
end
