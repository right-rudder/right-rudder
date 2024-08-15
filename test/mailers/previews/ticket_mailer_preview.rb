class TicketMailerPreview < ActionMailer::Preview
  def completed_ticket
    ticket = Ticket.last
    user = User.last
    actor = User.first
    TicketMailer.with(ticket: ticket, user: user, actor: actor).completed_ticket
  end

  def assigned_ticket
    ticket = Ticket.last
    user = User.last
    actor = User.first
    TicketMailer.with(ticket: ticket, user: user, actor: actor).assigned_ticket
  end

  def unassigned_ticket
    ticket = Ticket.last
    user = User.last
    actor = User.first
    TicketMailer.with(ticket: ticket, user: user, actor: actor).unassigned_ticket
  end
end
