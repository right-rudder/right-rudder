# Create a ticket subscription for all users that created that ticket, are assigned to that ticket and are notified when done
Ticket.all.each do |ticket|
  users = ticket.assigned_users + ticket.notified_users + [ticket.creator]
  users.uniq.each do |user|
    TicketSubscription.create(ticket: ticket, user: user) unless TicketSubscription.where(ticket: ticket, user: user).exists?
  end
end
