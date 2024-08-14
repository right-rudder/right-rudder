class TicketSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates :user_id, uniqueness: { scope: :ticket_id, message: "is already subscribed to this ticket" }
end
