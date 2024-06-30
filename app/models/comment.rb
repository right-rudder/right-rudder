class Comment < ApplicationRecord
  belongs_to :task
  broadcasts_to :task
end
