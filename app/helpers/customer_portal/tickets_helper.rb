module CustomerPortal::TicketsHelper
  def tickets_to_show(account)
    if params["filter"] == "my-tickets"
      account.my_assigned_tickets(current_user)
    else
      account.tickets
    end
  end
end
