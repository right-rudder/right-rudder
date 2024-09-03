module TicketsHelper
  def ticket_categories(account)
    if params["filter"] == "my-tickets"
      tickets_scope = account.my_assigned_tickets(current_user).joins(:assigned_users).includes(:assigned_users, :rich_text_content)
    else
      tickets_scope = account.tickets.joins(:assigned_users).includes(:assigned_users, :rich_text_content)
    end
    {
      overdue: { tickets: tickets_scope.overdue, title: "Overdue", color: "text-red-500" },
      due_today: { tickets: tickets_scope.due_today, title: "Due today" },
      due_tomorrow: { tickets: tickets_scope.due_tomorrow, title: "Due tomorrow" },
      due_later_this_week: { tickets: tickets_scope.due_later_this_week, title: "Due later this week" },
      due_next_week: { tickets: tickets_scope.due_next_week, title: "Due next week" },
      due_later_within_a_month: { tickets: tickets_scope.due_later_within_a_month, title: "Due later within a month" },
      due_later: { tickets: tickets_scope.due_later, title: "Due later" },
      no_due_date: { tickets: tickets_scope.no_due_date, title: "No due date" },
      completed: { tickets: tickets_scope.completed, title: "Completed", color: "text-green-500" }
    }
  end

  def unique_id(account, key)
    "#{key}_#{account.id}"
  end
end
