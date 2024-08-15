module TicketsHelper
  def ticket_categories(account) = {
    overdue: { tickets: account.tickets_overdue, title: "Overdue", color: "text-red-500" },
    due_today: { tickets: account.tickets_due_today, title: "Due today" },
    due_tomorrow: { tickets: account.tickets_due_tomorrow, title: "Due tomorrow" },
    due_later_this_week: { tickets: account.tickets_due_later_this_week, title: "Due later this week" },
    due_next_week: { tickets: account.tickets_due_next_week, title: "Due next week" },
    due_later_within_a_month: { tickets: account.tickets_due_later_within_a_month, title: "Due later within a month" },
    due_later: { tickets: account.tickets_due_later, title: "Due later" },
    no_due_date: { tickets: account.tickets_no_due_date, title: "No due date" },
    completed: { tickets: account.tickets_completed, title: "Completed", color: "text-green-500" }
  }
end
