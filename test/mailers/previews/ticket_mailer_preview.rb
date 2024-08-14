class TicketMailerPreview < ActionMailer::Preview
  def completed_ticket
    ticket = Ticket.last
    user = User.last
    TicketMailer.with(ticket: ticket, user: user).completed_ticket
  end

  def assigned_ticket
    ticket = Ticket.last
    user = User.last
    TicketMailer.with(ticket: ticket, user: user).assigned_ticket
  end

  def unassigned_ticket
    ticket = Ticket.last
    user = User.last
    TicketMailer.with(ticket: ticket, user: user).unassigned_ticket
  end
end
