module TicketsHelper
  def ticket_categories = {
    overdue: { tickets: @overdue_tickets, title: "Overdue", color: "text-red-500" },
    due_today: { tickets: @due_today_tickets, title: "Due today" },
    due_tomorrow: { tickets: @due_tomorrow_tickets, title: "Due tomorrow" },
    due_later_this_week: { tickets: @due_later_this_week_tickets, title: "Due later this week" },
    due_next_week: { tickets: @due_next_week_tickets, title: "Due next week" },
    due_later_within_a_month: { tickets: @due_later_within_a_month_tickets, title: "Due later within a month" },
    due_later: { tickets: @due_later_tickets, title: "Due later" },
    no_due_date: { tickets: @no_due_date_tickets, title: "No due date" },
    completed: { tickets: @completed_tickets, title: "Completed", color: "text-green-500" }
  }
end
